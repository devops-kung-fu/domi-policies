package terraform

warn[msg] {
    policyID := "DOMI-0001"
    resources := input.resources[name]
    resources[_].tags == null
    msg = sprintf("%s: No tags found for the following resource(s): `%v`", [policyID, resources ])
}

warn[msg] {
    policyID := "DOMI-0002"
    resources := input.resources[name]
    resources[_].tags == []
    msg = sprintf("%s: Empty tags block found for the following resource(s): `%v`", [policyID, resources ])
}