resource "newrelic_nrql_alert_condition" "garden_tour_pwa_javascript_errors" {
    account_id = 3248905
    policy_id = 3921296
    type = "static"
    name = "Garden Tour PWA Error Rate"
    description = <<-EOT
    JavaScript Errors are high
    EOT
    enabled = true
    violation_time_limit_seconds = 259200

    nrql {
        query = "SELECT (filter(count(newrelic.timeslice.value), WHERE metricTimesliceName = 'EndUser/errors') / filter(count(newrelic.timeslice.value), WHERE metricTimesliceName = 'Browser')) as 'Javascript error rate' FROM Metric WHERE (entityGuid = 'MzI0ODkwNXxCUk9XU0VSfEFQUExJQ0FUSU9OfDExMjAxMzMzNDI')"
    }

    critical {
        operator = "above"
        threshold = 5
        threshold_duration = 300
        threshold_occurrences = "all"
    }

    warning {
        operator = "above"
        threshold = 1
        threshold_duration = 300
        threshold_occurrences = "all"
    }

    fill_option = "none"
    aggregation_window = 60
    aggregation_method = "event_timer"
    aggregation_timer = 60
}