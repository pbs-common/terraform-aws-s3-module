resource "aws_s3_bucket_logging" "logging" {
  count = var.logging_config != null ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  target_bucket = var.logging_config.target_bucket
  target_prefix = var.logging_config.target_prefix
}
