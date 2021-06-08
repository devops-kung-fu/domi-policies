package terraform.aws.kms

test_domi_aws_0100 {
    warn with input as {
        "resource": {
            "aws_kms_key": {
                "no_tags": {
                    "description": "This kms key is missing tags.",
                    "deletion_window_in_days": 10,
                    "enable_key_rotation": true
                }
            }
        }
    }
}

test_domi_aws_0101 {
    warn with input as {
        "resource": {
            "aws_kms_key": {
                "empty_tags": {
                    "description": "This kms key has empty tags.",
                    "deletion_window_in_days": 10,
                    "enable_key_rotation": true,
                    "tags": {}
                }
            }
        }
    }
}

test_domi_aws_0102 {
    warn with input as {
        "resource": {
            "aws_kms_key": {
                "key_rotation_disabled": {
                    "description": "This kms key has key rotation disabled.",
                    "deletion_window_in_days": 10,
                    "enable_key_rotation": false,
                    "tags": {
                        "Name": "No Key Rotation"
                    }
                }
            }
        }
    }
}

test_domi_aws_0102a {
    warn with input as {
        "resource": {
            "aws_kms_key": {
                "key_rotation_disabled": {
                    "description": "This kms key is missing key rotation.",
                    "deletion_window_in_days": 10,
                    "tags": {
                        "Name": "Missing Key Rotation"
                    }
                }
            }
        }
    }
}