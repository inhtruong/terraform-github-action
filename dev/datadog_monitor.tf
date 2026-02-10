resource "datadog_monitor" "maintenance_suspend_failed" {
  name = "[maintenance][${var.env}] suspend failed"

  type = "query alert"

  query = "sum(last_5m):default_zero(sum:test.execute.failure{env:${var.env}, part:suspend, status:failure}.as_count()) >= 1"

  message = <<EOT
  @duydat.dhsp@gmail.com
{{#is_alert}}
Failed to suspend maintenance mode.
{{/is_alert}}
EOT
  monitor_thresholds {
    critical = 1
    critical_recovery = null
  }

  timeout_h               = 0
  evaluation_delay        = 0
  notify_no_data          = false
  renotify_interval       = 0
  require_full_window     = true
  include_tags            = true
  notification_preset_name = "hide_query"

  tags = [
    "env:${var.env}",
    "service:maintenance",
  ]
}

resource "datadog_monitor" "maintenance_resume_failed" {
  name = "[maintenance][${var.env}] resume failed"

  type = "query alert"

  query = "sum(last_5m):default_zero(sum:test.execute.failure{env:${var.env}, part:resume, status:failure}.as_count()) >= 1"
  message = <<EOT
  @duydat.dhsp@gmail.com
{{#is_alert}}
Failed to resume maintenance mode.
{{/is_alert}}
EOT
  monitor_thresholds {
    critical = 1
    critical_recovery = null
  }

  timeout_h               = 0
  evaluation_delay        = 0
  notify_no_data          = false
  renotify_interval       = 0
  require_full_window     = true
  include_tags            = true
  notification_preset_name = "hide_query"

  tags = [
    "env:${var.env}",
    "service:maintenance",
  ]
}