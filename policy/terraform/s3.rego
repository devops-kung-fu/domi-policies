package terraform.aws.s3

has_field(obj, field) {
    obj[field]
}

warn[msg] {
    policyID := "DOMI-AWS-001"
    resources := input.resource.aws_s3_bucket[_]
    not has_field(resources, "tags")
    msg = sprintf("%s: No tags found for the following resource(s): `%v`", [ policyID, resources ])
}

warn[msg] {
    policyID := "DOMI-AWS-002"
    resources := input.resource.aws_s3_bucket[_]
    resources.tags == {} 
    msg = sprintf("%s: Empty tags block found for the following resource(s): `%v`", [ policyID, resources ])
}

deny[msg] {
    policyID := "DOMI-AWS-008"
    resource := input.resource.aws_s3_bucket[_]
    versioningEnabled := resource.versioning.enabled
    versioningEnabled == false 
    msg = sprintf("%s: S3 Versioning is not enabled: `%v`", [ policyID, resource ])
}

deny[msg] {
    policyID := "DOMI-AWS-009"
    resource := input.resource.aws_s3_bucket[_]
    resource.versioning == {} 
    msg = sprintf("%s: S3 Versioning `enabled` field missing: `%v`", [ policyID, resource ])
}

deny[msg] {
    policyID := "DOMI-AWS-010"
    bucket := input.resource.aws_s3_bucket[_]
    not has_field(bucket, "versioning") 
    msg = sprintf("%s: S3 Bucket Versioning block missing: `%v`", [ policyID, bucket ])
}

deny[msg] {
    policyID := "DOMI-AWS-011"
    bucket := input.resource.aws_s3_bucket[_]
    not has_field(bucket, "server_side_encryption_configuration") 
    msg = sprintf("%s: S3 Server Side Encryption configuration missing: `%v`", [ policyID, bucket ])
}