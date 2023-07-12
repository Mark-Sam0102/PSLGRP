output "id" {
  value       = module.public.id
  description = "The ID of the S3 bucket"
}
output "arn" {
  value       = module.public.arn
  description = "The Amazon Resource Name (ARN) of the S3 bucket"
}
output "object" {
  value = {
    id  = module.public.id
    arn = module.public.arn
  }
  description = "Important attributes of the resource such as ID and ARN as a single object / map"
}
output "website_endpoint" {
  value       = module.public.website_endpoint
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
}
output "website_domain" {
  value       = module.public.website_domain
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records."
}
output "domain_name" {
  value       = module.public.domain_name
  description = "The bucket domain name."
}
output "regional_domain_name" {
  value       = module.public.regional_domain_name
  description = "The bucket region-specific domain name. AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
}
