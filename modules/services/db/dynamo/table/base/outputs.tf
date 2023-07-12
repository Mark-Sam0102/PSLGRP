output "id" {
  value = aws_dynamodb_table.main.id
}

output "arn" {
  value = aws_dynamodb_table.main.arn
}

output "stream_arn" {
  value = aws_dynamodb_table.main.stream_arn
}

output "stream_label" {
  value = aws_dynamodb_table.main.stream_label
}
