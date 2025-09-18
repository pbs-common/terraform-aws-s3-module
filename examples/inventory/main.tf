module "s3_inventory" {
  source = "../.."

  name = "${var.product}-inventory"

  force_destroy = true

  organization = var.organization
  environment  = var.environment
  product      = var.product
  owner        = var.owner
  repo         = var.repo
}

module "s3" {
  source = "../.."

  inventory_config = {
    destination = {
      bucket = {
        name = module.s3_inventory.name
      }
    }
  }

  force_destroy = true

  organization = var.organization
  environment  = var.environment
  product      = var.product
  owner        = var.owner
  repo         = var.repo
}
