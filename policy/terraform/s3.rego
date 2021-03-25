package terraform.aws.s3

has_field(obj, field) {
    obj[field]
}

warn[msg] {
    policyID := "DOMI-AWS-001"
    resource := input.resource.aws_s3_bucket[_]
    not has_field(resource, "tags")
    msg = sprintf("%s: No tags found: `%v`", [ policyID, resource ])
}

warn[msg] {
    policyID := "DOMI-AWS-002"
    resource := input.resource.aws_s3_bucket[_]
    resource.tags == {} 
    msg = sprintf("%s: Empty tags block found: `%v`", [ policyID, resource[name] ])
}

deny[msg] {
    policyID := "DOMI-AWS-008"
    resource := input.resource.aws_s3_bucket[_]
    resource.versioning.enabled == false
    msg = sprintf("%s: S3 Versioning is not enabled: `%v`", [ policyID, resource.bucket ])
}

deny[msg] {
    policyID := "DOMI-AWS-009"
    resource := input.resource.aws_s3_bucket[_]
    resource.versioning == {} 
    msg = sprintf("%s: S3 Versioning `enabled` field missing: `%v`", [ policyID, resource[name] ])
}

deny[msg] {
    policyID := "DOMI-AWS-010"
    resource := input.resource.aws_s3_bucket[_]
    not has_field(resource, "versioning") 
    msg = sprintf("%s: S3 Bucket Versioning block missing: `%v`", [ policyID, resource[name] ])
}

deny[msg] {
    policyID := "DOMI-AWS-011"
    resource := input.resource.aws_s3_bucket[_]
    not has_field(resource, "server_side_encryption_configuration") 
    msg = sprintf("%s: S3 Server Side Encryption configuration missing: `%v`", [ policyID, resource[name] ])
}