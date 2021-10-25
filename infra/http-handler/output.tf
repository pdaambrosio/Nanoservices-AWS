output "http-role-arn" {
  value = aws_iam_role.lambda-http-role.arn
}

output "sns-handler-images-topic" {
  value = aws_sns_topic.sns-handler-images-topic.arn
}