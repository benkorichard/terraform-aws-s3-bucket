variable "bucket_name" {
  description = "Globally unique name for the S3 bucket."
  type        = string
}

variable "retention_days" {
  description = "Number of days to retain object versions."
  type        = number

  validation {
    condition     = var.retention_days > 0
    error_message = "retention_days must be greater than zero."
  }
}

variable "uploader_role_arn" {
  description = "IAM role allowed to upload objects to the bucket."
  type        = string
}

variable "tags" {
  description = "Additional tags applied to the bucket."
  type        = map(string)
  default     = {}
}
