package enforce_https_for_public_s3_buckets

import input.tfplan as tfplan

deny[msg] {
	r = tfplan.resource_changes[_]
	r.mode == "managed"
	r.type == "aws_s3_bucket"
	r.change.after.acl == "public"

	msg := sprintf("S3 buckets must not be PUBLIC")
}
