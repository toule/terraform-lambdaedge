provider "aws" {
	region = "us-east-1"
	shared_credentials_file = "../../credential/credentials"
}

terraform {
  required_version = ">= 0.9.5"
  backend "s3" {
    bucket = "terraform-ray-infra-tf-us-east-1"
    key = "state/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    lock_table = "TerraformStateLock"
    acl = "bucket-owner-full-control"
  }
}


