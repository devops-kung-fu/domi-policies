package terraform.aws

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
    resources := input.resource[_]
    has_field(resources, "tags")
    some i
    not resources.tags[i]
    msg = sprintf("%s: Empty tags block found for the following resource(s): `%v`", [policyID, resources ])
}