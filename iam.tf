data "aws_iam_role" "build_role_edge" {
	name = "build_role_edge"
	arn = "arn:aws:iam::264594923212:role/build_role_edge"
}

data "aws_iam_role" "lambda_role" {
	name = "lambda_role"
	arn = "arn:aws:iam::264594923212:role/lambda_role"
}

data "aws_iam_role" "codepipeline_role_edge" {
	name = "codepipeline_role_edge"
	arn = "arn:aws:iam::264594923212:role/codepipeline_role_edge"
}
