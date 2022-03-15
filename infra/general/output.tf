output "elasticsearch-vpc" {
  value = aws_vpc.elasticsearch-vpc.id
}

output "elasticsearch-vpc-subnets" {
  value = ["${aws_subnet.elasticsearch-vpc-private.*.id}"]
}

output "post-processing-queue-arn" {
  value = aws_sqs_queue.post-processing-image.arn
}

output "post-processing-queue-url" {
  value = aws_sqs_queue.post-processing-image.url
}

output "elasticsearch-endpoint" {
  value = aws_elasticsearch_domain.elasticsearch-images.endpoint
}

output "kibana-endpoint" {
  value = aws_elasticsearch_domain.elasticsearch-images.kibana_endpoint
}
