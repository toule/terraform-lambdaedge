resource "aws_cloudfront_distribution" "edge_distribution" {
	enabled = "true"
	comment = "cloudfront lambda edge CI/CD Test"
	origin {
		domain_name = "aws.amazon.com"
		origin_id = "MyOrigin"

		custom_origin_config {
			http_port = 80
			https_port = 443
			origin_protocol_policy = "match-viewer"
			origin_ssl_protocols = ["TLSv1"]
		}
	}
	viewer_certificate {
		acm_certificate_arn = "arn:aws:acm:us-east-1:264594923212:certificate/9b287547-12eb-42bd-8d6b-871395566189"
		ssl_support_method = "sni-only"
	}
	default_cache_behavior {
		target_origin_id = "MyOrigin"
		allowed_methods = ["GET","HEAD","OPTIONS"]
		cached_methods = ["GET","HEAD"]
		forwarded_values {
			query_string = false
			headers = ["Origin"]

			cookies {
				forward = "none"
			}
		}
		viewer_protocol_policy = "allow-all"

		lambda_function_association {
			event_type = "origin-request"
			lambda_arn = "${aws_lambda_function.lambda_edge_stage.qualified_arn}"
			include_body = false
		}
	}

	restrictions {
		geo_restriction {
			restriction_type = "none"
		}
	}
}

output "cf_id" {
  value       = "${aws_cloudfront_distribution.edge_distribution.id}"
  description = "ID of AWS CloudFront distribution"
}

output "cf_arn" {
  value       = "${aws_cloudfront_distribution.edge_distribution.arn}"
  description = "ARN of AWS CloudFront distribution"
}

output "cf_status" {
  value       = "${aws_cloudfront_distribution.edge_distribution.status}"
  description = "Current status of the distribution"
}

output "cf_domain_name" {
  value       = "${aws_cloudfront_distribution.edge_distribution.domain_name}"
  description = "Domain name corresponding to the distribution"
}

output "cf_etag" {
  value       = "${aws_cloudfront_distribution.edge_distribution.etag}"
  description = "Current version of the distribution's information"
}

output "cf_hosted_zone_id" {
  value       = "${aws_cloudfront_distribution.edge_distribution.hosted_zone_id}"
  description = "CloudFront Route 53 zone ID"
}
