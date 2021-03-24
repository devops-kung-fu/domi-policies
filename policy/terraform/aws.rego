package terraform.aws

has_field(obj, field) {
    obj[field]
}

deny[msg] {
    policyID := "DOMI-AWS-003"
    resource := input.terraform.backend.s3.encrypt
    not resource
    msg = sprintf("%s: Terraform S3 backend encryption is set to false: `%v`", [ policyID, resource ])
}

deny[msg] {
    policyID := "DOMI-AWS-004"
    not has_field(input.terraform.backend.s3, "encrypt")
    msg = sprintf("%s: Terraform S3 backend encryption field is missing: `%v`", [ policyID ])
}

deny[msg] {
    policyID := "DOMI-AWS-005"
    not has_field(input.terraform, "backend")
    msg = sprintf("%s: Terraform backend configuration is missing: `%v`", [ policyID ])
}

deny[msg] {
    policyID := "DOMI-AWS-006"
    awsAccessKey := input.provider.aws.access_key
    not re_match("var\\.(.*)", awsAccessKey)
    msg = sprintf("%s: Possible plain text AWS Access Key found: `%v`", [ policyID, awsAccessKey ])
}

deny[msg] {
    policyID := "DOMI-AWS-007"
    awsSecretAccessKey := input.provider.aws.secret_key
    not re_match("var\\.(.*)", awsSecretAccessKey)
    msg = sprintf("%s: Possible plain text AWS Secret Access Key found: `%v`", [ policyID, awsSecretAccessKey ])
}