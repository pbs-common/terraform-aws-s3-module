# PBS TF S3 Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-s3-module?ref=x.y.z
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

This module provisions an S3 bucket.

The bucket will be `AES256` encrypted, without the option to adjust that.

By default, the bucket will be versioned. This can be adjusted by using the `is_versioned` parameter.

If your use case requires adjusting the CORS configuration of the bucket, that is exposed through the `cors_rules` parameter.

Integrate this module like so:

```hcl
module "s3" {
  source = "github.com/pbs/terraform-aws-s3-module?ref=x.y.z"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

It is highly recommended that you integrate an inventory prefix when using this module.

Do this like so:

```hcl
module "s3" {
  source  = "../modules/s3"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
  inventory_bucket = var.inventory_bucket
}
```

### Server access logging

`logging_config` delivers server access logs to another bucket. Omit it and no logs are delivered.

```hcl
logging_config = {
  target_bucket = "my-log-bucket"
  target_prefix = "my-app-prod-s3/"
}
```

> :warning: The destination bucket must already permit delivery, and this module does not manage it — `PutBucketLogging` fails outright if delivery is not permitted. Grant it either with a bucket policy allowing `logging.s3.amazonaws.com`, or with the `log-delivery-write` canned ACL.
>
> Watch out for a `force_tls` policy on the destination: denying requests without `aws:SecureTransport` is a known way to block log delivery.

See [the logging example](/examples/logging).

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs
