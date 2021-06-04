package terraform.aws.s3

test_domi_aws_0000 {
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

test_domi_aws_0001 {
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

test_domi_aws_0007 {
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

test_domi_aws_0008 {
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

test_domi_aws_0009 {
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

test_domi_aws_0010 {
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

test_domi_aws_0011 {
   deny with input as {
        "resource": {
            "aws_s3_bucket": {
                "master_builders": {
                    "bucket": "master-builders",
                    "versioning": {
                        "mfa_delete": false
                    }
                }
            }
        }
    } 
}