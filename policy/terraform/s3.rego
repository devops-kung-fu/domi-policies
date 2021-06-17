package terraform.aws.s3

has_field(obj, field) {
    obj[field]
}

warn[msg] {
    policyID := "DOMI-AWS-0000"
    resource := input.resource.aws_s3_bucket[bucket]
    not has_field(resource, "tags")
    msg = sprintf("%s: No tags found: `%v`", [ policyID, bucket ])
}

warn[msg] {
    policyID := "DOMI-AWS-0001"
    resource := input.resource.aws_s3_bucket[bucket]
    resource.tags == {} 
    msg = sprintf("%s: Empty tags block found: `%v`", [ policyID, bucket ])
}

warn[msg] {
    policyID := "DOMI-AWS-0002"
    resource := input.resource.aws_s3_bucket[bucket]
    not has_field(resource, "logging") 
    msg = sprintf("%s: Access Logging is not configured: `%v`", [ policyID, bucket ])
}

deny[msg] {
    policyID := "DOMI-AWS-0007"
    resource := input.resource.aws_s3_bucket[bucket]
    resource.versioning.enabled == false
    msg = sprintf("%s: S3 Versioning is not `enabled`: `%v`", [ policyID, bucket ])
}

deny[msg] {
    policyID := "DOMI-AWS-0008"
    resource := input.resource.aws_s3_bucket[bucket]
    resource.versioning == {} 
    msg = sprintf("%s: S3 Versioning block is empty: `%v`", [ policyID, bucket ])
}

deny[msg] {
    policyID := "DOMI-AWS-0009"
    resource := input.resource.aws_s3_bucket[bucket]
    not has_field(resource, "versioning") 
    msg = sprintf("%s: S3 Bucket Versioning block missing: `%v`", [ policyID, bucket ])
}

deny[msg] {
    policyID := "DOMI-AWS-0010"
    resource := input.resource.aws_s3_bucket[bucket]
    not has_field(resource, "server_side_encryption_configuration") 
    msg = sprintf("%s: S3 Server Side Encryption configuration missing: `%v`", [ policyID, bucket ])
}

deny[msg] {
    policyID := "DOMI-AWS-0011"
    resource := input.resource.aws_s3_bucket[bucket]
    resource.versioning.mfa_delete == false
    msg = sprintf("%s: S3 Versioning `mfa_delete` is not enabled: `%v`", [ policyID, bucket ])
}
