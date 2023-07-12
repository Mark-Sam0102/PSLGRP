resource "aws_s3_bucket_notification" "main" {
  bucket = var.bucket.id

  dynamic "topic" {
    for_each = var.topics

    content {
      id            = topic.value.id
      topic_arn     = topic.value.arn
      events        = topic.value.events
      filter_prefix = topic.value.filter_prefix
      filter_suffix = topic.value.filter_suffix
    }
  }

  dynamic "queue" {
    for_each = var.queues

    content {
      id            = queue.value.id
      queue_arn     = queue.value.arn
      events        = queue.value.events
      filter_prefix = queue.value.filter_prefix
      filter_suffix = queue.value.filter_suffix
    }
  }

  dynamic "lambda_function" {
    for_each = var.lambda_functions

    content {
      id                  = lambda_function.value.id
      lambda_function_arn = lambda_function.value.arn
      events              = lambda_function.value.events
      filter_prefix       = lambda_function.value.filter_prefix
      filter_suffix       = lambda_function.value.filter_suffix
    }
  }

  depends_on = [
    aws_lambda_permission.allow_s3
  ]
}

# © 2022 Persistent Systems, <cloud-automation-stack@persistent.com>
