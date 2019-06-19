resource "aws_s3_bucket" "bucket-tf" {
	bucket = "terraform-ray-infra-tf-us-east-1"
	acl = "private"

	tags = {
		Name = "source/build Arti"
		Environment = "DEV"
	}
}
