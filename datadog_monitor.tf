// Using monitor to alert on terraform failures in CI pipeline
resource "datadog_monitor" "terraform_failure_multi" {
  name = "Terraform Failure - ${var.env} (Multi Alert)"

  type = "query alert"

  query = "sum(last_5m):default_zero(sum:test.execute.failure{env:dev, part:suspend, status:failure} by {job}.as_count()) >= 1"

  message = <<EOT
{{#is_match "job.name" "apply"}}
🚨 Terraform apply failed!!!
{{/is_match}}

{{#is_match "job.name" "synthetic_test"}}
🔥 Synthetic test failed!!!
{{/is_match}}

Environment: ${var.env}

Please check CI pipeline.

@duydat.dhsp@gmail.com
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
    "service:terraform"
  ]
}

// Using 2 monitors to alert on terraform apply failures and synthetic test failures
resource "datadog_monitor" "terraform_apply_failure" {
  name = "Terraform Apply Failure - ${var.env}"

  type = "query alert"

  query = "sum(last_5m):default_zero(sum:test.execute.failure{env:dev, part:suspend, job:apply, status:failure}.as_count()) >= 1"

  message = <<EOT
Terraform apply failed!!! (test 2 monitor)

Environment: ${var.env}

Please check CI pipeline.

@duydat.dhsp@gmail.com
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
    "service:terraform"
  ]
}

resource "datadog_monitor" "synthetic_test_failure" {
  name = "Synthetic Test Failure - ${var.env}"

  type = "query alert"

  query = "sum(last_5m):default_zero(sum:test.execute.failure{env:dev, part:suspend, job:synthetic_test, status:failure}.as_count()) >= 1"

  message = <<EOT
Synthetic Test failed!!! (test 2 monitor)

Environment: ${var.env}

Please check CI pipeline.

@duydat.dhsp@gmail.com
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
    "service:terraform"
  ]
}