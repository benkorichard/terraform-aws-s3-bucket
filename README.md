# terraform-aws-s3-bucket

This module creates an S3 bucket with the following features:
- Versioning enabled
- Encryption enabled
- Public access blocked
- HTTPS-only access
- Lifecycle expiration for current and noncurrent object versions
- Retention period and uploader role configurable by the caller

## Usage

```hcl
module "backup_bucket" {
	source = "github.com/benkorichard/terraform-aws-s3-bucket"

	bucket_name       = "application-backups-example"
	retention_days 	  = 180
	uploader_role_arn = "arn:aws:iam::000000000000:role/role_name"
}
```
