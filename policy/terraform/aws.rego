package terraform.aws

has_field(obj, field) {
    obj[field]
}

deny[msg] {
    policyID := "DOMI-AWS-003"
    resource := input.terraform.backend[backend]
    resource.s3.encrypt == false
    msg = sprintf("%s: Terraform S3 backend encryption is set to false: `%v`", [ policyID, backend ])
}

deny[msg] {
    policyID := "DOMI-AWS-004"
    resource := input.terraform.backend[backend]
    resource.s3 == {}
    msg = sprintf("%s: Terraform S3 backend encryption field is missing: `%v`", [ policyID, backend ])
}

deny[msg] {
    policyID := "DOMI-AWS-005"
    resource := input.terraform
    not has_field(resource, "backend")
    msg = sprintf("%s: Terraform backend configuration is missing.", [ policyID ])
}

deny[msg] {
    policyID := "DOMI-AWS-006"
    resource := input.provider[provider]
    awsAccessKey := resource.access_key
    not re_match("var\\.(.*)", awsAccessKey)
    msg = sprintf("%s: Possible plain text AWS Access Key found: `%v`", [ policyID, provider ])
}

deny[msg] {
    policyID := "DOMI-AWS-007"
    resource := input.provider[provider]
    awsSecretAccessKey := resource.secret_key
    not re_match("var\\.(.*)", awsSecretAccessKey)
    msg = sprintf("%s: Possible plain text AWS Secret Access Key found: `%v`", [ policyID, provider ])
}