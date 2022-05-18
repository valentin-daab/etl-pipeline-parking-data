resource "aws_lambda_function" "parking_analysis" {
  filename = "../payload.zip"
  function_name = "parking_analysis"
  handler = "parking_data.lambda_handler"
  role = "${aws_iam_role.lambda_execution_role.arn}"
  runtime = "python3.7"
  timeout = "300"
}
