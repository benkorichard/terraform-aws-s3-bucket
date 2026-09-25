# terraform-aws-s3-bucket

This module creates a private, versioned S3 bucket with encryption, public access blocking, HTTPS-only access, and lifecycle expiration for current and noncurrent object versions.

The caller controls the retention period and uploader role. The configured role can upload objects and use multipart uploads, but cannot read or delete them.

## Usage

```hcl
module "backup_bucket" {
	source = "github.com/benkorichard/terraform-aws-s3-bucket"

	bucket_name = "application-backups-example"
	retention_days = var.backup_retention_days
	uploader_role_arn = var.backup_uploader_role_arn
}
```
