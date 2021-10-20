# resource "aws_kms_key" "bucket-handler-key" {
#    deletion_window_in_days = 10
# }

resource "aws_s3_bucket" "bucket-handler-images" {
    bucket = "${var.prefix}-images"
    acl = "private"
    tags = var.tags
    # server_side_encryption_configuration {
    #   rule {
    #     apply_server_side_encryption_by_default {
    #       kms_master_key_id = aws_kms_key.bucket-handler-key.arn
    #       sse_algorithm = "aws:kms"
    #     }
    #   }
    # }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.bucket-handler-images.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}