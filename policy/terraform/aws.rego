package terraform

deny[msg] {
    policyID := "DOMI-0001"
    trace(sprintf("Input: %v", [input]))
    resources := input.resources[resources_type]
    tags := resources[name].tags
    tags == []
    msg = sprintf("%s: No tags foung for the following resource(s): `%v`", [policyID, resources ])
}