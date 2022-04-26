resource "aws_sqs_queue" "post-processing-image" {
  name       = "post-processing-image-queue"
  fifo_queue = false
  tags       = var.tags
}

resource "aws_ssm_parameter" "ssm-post-processing-image" {
  name        = "/${var.prefix}/post-processing-image"
  description = "SQS queue for post-processing image"
  type        = "String"
  value       = aws_sqs_queue.post-processing-image.arn
}
