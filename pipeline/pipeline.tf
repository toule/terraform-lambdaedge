resource "aws_kms_key" "enkey" {}

resource "aws_kms_alias" "s3kmskey" {
    name = "alias/KmsKey"
	target_key_id = "${aws_kms_key.enkey.key_id}"
}

resource "aws_codepipeline" "terraform_pipeline" {
  name     = "terraform_pipeline"
  role_arn = "${aws_iam_role.codepipeline_role_edge.arn}"

  artifact_store {
    location = "${aws_s3_bucket.bucket-tf.bucket}"
    type     = "S3"

    encryption_key {
      id   = "${aws_kms_alias.s3kmskey.arn}"
      type = "KMS"
    }
  }

  stage {
    name = "Source"

    action {
      name = "Source"
      category = "Source"
      owner = "ThirdParty"
      provider = "GitHub"
      version = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner = "toule"
        Repo = "terraform-lambdaedge"
        Branch = "master"
		OAuthToken = "b8accd6ddc95d07a535e97c17f6cbf221fed8321"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_outp"]
      version          = "1"

      configuration = {
        ProjectName = "terraform_edgebuild"
      }
    }
  }
}
