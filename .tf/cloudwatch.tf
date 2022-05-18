resource "aws_cloudwatch_event_rule" "every_5min" {
  name = "every-5min"
  description = "Sends a trigger every 5min"
  schedule_expression = "rate(5 minutes)"
  is_enabled = false
}

resource "aws_cloudwatch_event_target" "trigger_cmo_strategy" {
  rule = "${aws_cloudwatch_event_rule.every_5min.name}"
  target_id = "parking_analysis"
  arn = "${aws_lambda_function.parking_analysis.arn}"
}
