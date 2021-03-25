package terraform.aws.s3

test_domi_aws_001 {
    warn with input as {
        "resource": {
            "aws_s3_bucket": {
                "patbot_logs": {
                    "bucket": "patbot-logs"
                }
            }
        }
    }
}

test_domi_aws_002 {
    warn with input as {
        "resource": {
            "aws_s3_bucket": {
                "master_builders": {
                    "bucket": "master-builders",
                    "tags": {}
                }
            }
        }
    }
}

test_domi_aws_008 {
   deny with input as {
        "resource": {
            "aws_s3_bucket": {
                "master_builders": {
                    "bucket": "master-builders",
                    "versioning": {
                        "enabled": false
                    }
                }
            }
        }
    } 
}

test_domi_aws_009 {
   deny with input as {
        "resource": {
            "aws_s3_bucket": {
                "master_builders": {
                    "bucket": "master-builders",
                    "versioning": {},
                }
            }
        }
    } 
}

test_domi_aws_010 {
   deny with input as {
        "resource": {
            "aws_s3_bucket": {
                "master_builders": {
                    "bucket": "master-builders",
                }
            }
        }
    } 
}