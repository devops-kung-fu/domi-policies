package terraform.aws

test_domi_aws_003 {
    deny with input as {
        "terraform": {
            "backend": {
                "s3": {
                    "encrypt": false,
                }
            }
        }
    }
}

test_domi_aws_004 {
    deny with input as {
        "terraform": {
            "backend": {
                "s3": {}
            }
        }
    }
}

test_domi_aws_005 {
    deny with input as {
        "terraform": {}
    }
}

test_domi_aws_006 {
    deny with input as {
        "provider": {
            "aws": {
                "access_key": "mock_access_key"
            }
        }
    }
}

test_domi_aws_007 {
    deny with input as {
        "provider": {
            "aws": {
                "secret_key": "mock_secret_key"
            }
        }
    }
}