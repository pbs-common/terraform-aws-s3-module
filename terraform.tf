terraform {
  required_version = ">= 1.13.0"
  required_providers {
    # tflint-ignore: terraform_unused_required_providers
    aws = {
      source = "hashicorp/aws"
      # 6.22.0 introduced rule.blocked_encryption_types on
      # aws_s3_bucket_server_side_encryption_configuration, and 6.40.0 made it Optional+Computed
      # so that buckets AWS has already switched to blocking SSE-C stop showing perpetual drift.
      # Both are needed for var.blocked_encryption_types to behave, hence the floor is 6.40.0
      # rather than 6.0.0.
      version = ">= 6.40.0"
    }
  }
}

