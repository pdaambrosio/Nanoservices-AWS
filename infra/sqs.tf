resource "aws_sqs_queue" "post-processing-image" {
    name = "post-processing-image-queue"
    fifo_queue = false
}
