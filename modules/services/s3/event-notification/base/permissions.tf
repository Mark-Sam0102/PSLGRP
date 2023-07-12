resource "aws_lambda_permission" "allow_s3" {

  count = length(var.lambda_functions)

  action        = "lambda:InvokeFunction"
  function_name = var.lambda_functions[count.index].arn
  principal     = "s3.amazonaws.com"
  source_arn    = var.bucket.arn
}

# TODO: Figure out way to set permissions for SNS and SQS
