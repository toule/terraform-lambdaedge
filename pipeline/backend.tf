terraform {
  backend "s3" {
    bucket = "/terraform-ray-infra-tf-us-east-1"
    key    = "state/terraform.state"
    region = "us-east-1"
  }
}
