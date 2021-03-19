package terraform

warn[msg] {
    policyID := "DOMI-0001"
    trace(sprintf("Input: %v", [input]))
    resources := input.resource[resource_type]
    tags := resources[name].tags
    tags == []
    msg = sprintf("%s: No tags foung for the following resource(s): `%v`", [policyID, resources])
}