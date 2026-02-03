resource "datadog_monitor" "terraform_plan_diff" {
  name = "Terraform Plan Diff Detected"
  type = "metric alert"
  query = "avg(last_5m):avg:terraform.plan.diff{env:prod} > 0"
  message = <<EOT
Terraform plan detected changes in prod.
@pagerduty-terraform-service
EOT

  thresholds {
    critical = 0
  }

  notify_no_data = false
  renotify_interval = 60

  tags = [
    "team:devops",
    "managed-by:terraform"
  ]
}
