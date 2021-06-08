package terraform.aws.kms

has_field(obj, field) {
    obj[field]
}

warn[msg] {
    policyID := "DOMI-AWS-0100"
    resource := input.resource.aws_kms_key[key]
    not has_field(resource, "tags")
    msg = sprintf("%s: No tags found: `%v`", [ policyID, key ])
}

warn[msg] {
    policyID := "DOMI-AWS-0101"
    resource := input.resource.aws_kms_key[key]
    resource.tags == {} 
    msg = sprintf("%s: Empty tags block found: `%v`", [ policyID, key ])
}

deny[msg] {
    policyID := "DOMI-AWS-0102"
    resource := input.resource.aws_kms_key[key]
    resource.enable_key_rotation == false
    msg = sprintf("%s: Key rotation is not `enabled`: `%v`", [ policyID, key ])
}
