package terraform

warn[msg] {
    policyID := "DOMI-0001"
    resource := input.resources[name]
    resource.tags == null
    msg = sprintf("%s: No tags found for the following resource(s): `%v`", [policyID, resource ])
}

warn[msg] {
    policyID := "DOMI-0002"
    resource := input.resources[name]
    resource.tags == []
    msg = sprintf("%s: Empty tags block found for the following resource(s): `%v`", [policyID, resource ])
}