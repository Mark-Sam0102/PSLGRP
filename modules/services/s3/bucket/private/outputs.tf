output "id" {
  value       = module.main.id
  description = "The ID of the S3 bucket"

  depends_on = [
    aws_s3_bucket_public_access_block.main
  ]
}
output "arn" {
  value       = module.main.arn
  description = "The Amazon Resource Name (ARN) of the S3 bucket"

  depends_on = [
    aws_s3_bucket_public_access_block.main
  ]
}

output "object" {
  value       = module.main.object
  description = "Important attributes of the resource such as ID and ARN as a single object / map"

  depends_on = [
    aws_s3_bucket_public_access_block.main
  ]
}
output "domain_name" {
  value       = module.main.domain_name
  description = "The bucket domain name."
}
output "regional_domain_name" {
  value       = module.main.regional_domain_name
  description = "The bucket region-specific domain name. AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
}
