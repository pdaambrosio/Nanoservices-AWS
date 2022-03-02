output "http-handler" {
  value = module.http-handler
}

output "thumbnail-handler" {
  value = module.thumbnail-handler
}

output "image-tagging-filter" {
  value = module.image-tagging-filter
}

output "post-processing-queue-arn" {
  value = aws_sqs_queue.post-processing-image.arn
}

output "post-processing-queue-url" {
  value = aws_sqs_queue.post-processing-image.url
}
