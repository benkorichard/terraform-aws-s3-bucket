data "aws_iam_policy_document" "bucket" {
  statement {
    sid    = "AllowBackupUploaderMultipartUploads"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [var.uploader_role_arn]
    }

    actions = [
      "s3:AbortMultipartUpload",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
    ]

    resources = ["${aws_s3_bucket.this.arn}/*"]
  }

  statement {
    sid    = "AllowBackupUploaderListMultipartUploads"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [var.uploader_role_arn]
    }

    actions   = ["s3:ListBucketMultipartUploads"]
    resources = [aws_s3_bucket.this.arn]
  }

  statement {
    sid    = "DenyInsecureTransport"
    effect = "Deny"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:*"]

    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}
