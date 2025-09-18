module "s3" {
  source = "../.."

  create_bucket_policy = false

  organization = var.organization
  environment  = var.environment
  product      = var.product
  owner        = var.owner
  repo         = var.repo
}
