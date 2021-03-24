# domi-policies

| Policy | Level | Description |
| ------ | ----- | ----------- |
| DOMI-AWS-001 | Warn | No tags founds. |
| DOMI-AWS-002 | Warn | Empty tags block. |
| DOMI-AWS-003 | Deny | Terraform S3 backend encryption is set to false. |
| DOMI-AWS-004 | Deny | Terraform S3 backend encryption field is missing. |
| DOMI-AWS-005 | Deny | Terraform backend configuration is missing. |
| DOMI-AWS-006 | Deny | Possible plain text AWS Access Key found. |
| DOMI-AWS-007 | Deny | Possible plain text AWS Secret Access Key found. |
| DOMI-AWS-008 | Deny | S3 Versioning is not enabled. |
| DOMI-AWS-009 | Deny | S3 Versioning enabled field missing. |
| DOMI-AWS-010 | Deny | S3 Versioning block missing. |
| DOMI-AWS-011 | Deny | S3 Server-side encryption not configured. |
| DOMI-AWS-012 | Deny | S3 MFA-Delete is not enabled. |