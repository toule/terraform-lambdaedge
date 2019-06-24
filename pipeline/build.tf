resource "aws_codebuild_project" "terraform_edgebuild" {
  name          = "terraform_edgebuild"
  description   = "test build"
  build_timeout = "60"
  service_role  = "${aws_iam_role.build_role_edge.arn}"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

  }

  source {
    type = "CODEPIPELINE"
  }

  tags = {
    Environment = "Test"
  }
}
