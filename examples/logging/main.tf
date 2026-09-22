# A bucket that delivers server access logs to a second bucket.
#
# The destination bucket has to permit delivery before PutBucketLogging will succeed, which this
# module does not do for you — it manages the bucket being logged, not the target. Here that is the
# `log-delivery-write` canned ACL, the long-standing way to grant it.
#
# The default bucket policy is switched off on the destination: its `force_tls` statement denies
# requests without `aws:SecureTransport`, which is a known way to block log delivery. A destination
# that needs a policy should grant `logging.s3.amazonaws.com` explicitly instead.
module "s3_logs" {
  source = "../.."

  name = "${var.product}-logs"

  acl = {
    canned_acl = "log-delivery-write"
  }

  create_bucket_policy = false

  force_destroy = true

  organization = var.organization
  environment  = var.environment
  product      = var.product
  owner        = var.owner
  repo         = var.repo
}

module "s3" {
  source = "../.."

  logging_config = {
    target_bucket = module.s3_logs.name
    target_prefix = "${var.product}-s3/"
  }

  force_destroy = true

  organization = var.organization
  environment  = var.environment
  product      = var.product
  owner        = var.owner
  repo         = var.repo
}