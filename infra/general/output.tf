output "post-processing-queue-arn" {
  value = aws_sqs_queue.post-processing-image.arn
}

output "post-processing-queue-url" {
  value = aws_sqs_queue.post-processing-image.url
}