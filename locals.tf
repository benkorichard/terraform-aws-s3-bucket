locals {
  common_tags = merge(var.tags, {
    Module = "terraform-aws-s3-bucket"
  })
}
