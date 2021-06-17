package terraform.aws

test_domi_aws_0200 {
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

test_domi_aws_0201 {
    deny with input as {
        "terraform": {
            "backend": {
                "s3": {}
            }
        }
    }
}

test_domi_aws_0202 {
    deny with input as {
        "terraform": {}
    }
}

test_domi_aws_0203 {
    deny with input as {
        "provider": {
            "aws": {
                "access_key": "mock_access_key"
            }
        }
    }
}

test_domi_aws_0204 {
    deny with input as {
        "provider": {
            "aws": {
                "secret_key": "mock_secret_key"
            }
        }
    }
}