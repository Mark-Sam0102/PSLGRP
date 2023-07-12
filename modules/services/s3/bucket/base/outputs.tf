output "id" {
  value       = aws_s3_bucket.main.id
  description = "The ID of the S3 bucket"

  depends_on = [
    aws_s3_bucket_policy.main
  ]
}
output "arn" {
  value       = aws_s3_bucket.main.arn
  description = "The Amazon Resource Name (ARN) of the S3 bucket"

  depends_on = [
    aws_s3_bucket_policy.main
  ]
}
output "object" {
  value = {
    id  = aws_s3_bucket.main.id
    arn = aws_s3_bucket.main.arn
  }
  description = "Important attributes of the resource such as ID and ARN as a single object / map"

  depends_on = [
    aws_s3_bucket_policy.main
  ]
}
output "website_endpoint" {
  value       = aws_s3_bucket_website_configuration.website_config[*].website_endpoint
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
}
output "website_domain" {
  value       = aws_s3_bucket_website_configuration.website_config[*].website_domain
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records."
}
output "domain_name" {
  value       = aws_s3_bucket.main.bucket_domain_name
  description = "The bucket domain name."
}
output "regional_domain_name" {
  value       = aws_s3_bucket.main.bucket_regional_domain_name
  description = "The bucket region-specific domain name. AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
}
