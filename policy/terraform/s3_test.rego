package terraform.aws.s3

test_domi_aws_0000 {
    warn with input as {
        "resource": {
            "aws_s3_bucket": {
                "no_tags": {
                    "bucket": "no-tags",
                    "versioning": {
                        "enabled": true
                    },
                    "server_side_encryption_configuration": {
                        "rule": {
                            "apply_server_side_encryption_by_default": {
                                "kms_master_key_id": "deadbeef-dead-beef-dead-beefdeadbeef",
                                "sse_algorithm": "aws:kms"
                            }
                        }
                    }
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