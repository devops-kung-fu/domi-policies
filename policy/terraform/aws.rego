package terraform

deny[msg] {
    policyID := "DOMI-0001"
    resources := input.resources[name]
    resources.tags == []
    msg = sprintf("%s: No tags foung for the following resource(s): `%v`", [policyID, resources ])
}