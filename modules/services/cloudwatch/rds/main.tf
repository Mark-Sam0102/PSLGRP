resource "aws_cloudwatch_query_definition" "log-insights-monitor_failed_db_login" {
  name = var.monitor_failed_db_login
  query_string = <<EOF
fields @timestamp, @message
| sort @timestamp desc
| limit 20
| parse @message "Login failed for user *" as user
| stats count(user) as failed_logins by bin(5m)
EOF
}

resource "aws_cloudwatch_query_definition" "log-insights-monitor_db_cpu_usage" {
  name = var.monitor_db_cpu_usage
  query_string = <<EOF
fields @timestamp, @message
| sort @timestamp desc
| limit 20
| parse @message "DB CPU *" as cpu
| stats avg(cpu) as avg_cpu by bin(5m)
EOF
}
