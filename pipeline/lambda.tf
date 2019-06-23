resource "aws_lambda_function" "lambda_edge" {
  filename      = "lambda_edge.zip"
  function_name = "lambda_edge"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "lambda_edge.test"
  publish		= "true"

#  source_code_hash = "${filebase64sha256("lambda_function_payload.zip")}"

  runtime = "nodejs8.10"
}

resource "aws_lambda_alias" "lambda_alias" {
	name = "lambda_alias"
	function_name = "${aws_lambda_function.lambda_edge.arn}"
	function_version = "${aws_lambda_function.lambda_edge.version}"
}
