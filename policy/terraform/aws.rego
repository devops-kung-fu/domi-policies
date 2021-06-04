package terraform.aws

has_field(obj, field) {
    obj[field]
}

deny[msg] {
    policyID := "DOMI-AWS-0002"
    resource := input.terraform.backend.s3.encrypt
    msg = sprintf("%s: Terraform S3 backend encryption is set to false.", [ policyID ])
}

deny[msg] {
    policyID := "DOMI-AWS-0003"
    resource := input.terraform.backend.s3
    resource == {}
    msg = sprintf("%s: Terraform S3 backend encryption field is missing.", [ policyID ])
}

deny[msg] {
    policyID := "DOMI-AWS-0004"
    resource := input.terraform
    not has_field(resource, "backend")
    msg = sprintf("%s: Terraform backend configuration is missing.", [ policyID ])
}

deny[msg] {
    policyID := "DOMI-AWS-0005"
    resource := input.provider[provider]
    awsAccessKey := resource.access_key
    not re_match("var\\.(.*)", awsAccessKey)
    msg = sprintf("%s: Possible plain text AWS Access Key found: `%v`", [ policyID, provider ])
}

deny[msg] {
    policyID := "DOMI-AWS-0006"
    resource := input.provider[provider]
    awsSecretAccessKey := resource.secret_key
    not re_match("var\\.(.*)", awsSecretAccessKey)
    msg = sprintf("%s: Possible plain text AWS Secret Access Key found: `%v`", [ policyID, provider ])
}