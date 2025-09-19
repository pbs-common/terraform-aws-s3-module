module "s3" {
  source = "../.."

  acl = {
    canned_acl = "private"
  }

  organization = var.organization
  environment  = var.environment
  product      = var.product
  owner        = var.owner
  repo         = var.repo
}
