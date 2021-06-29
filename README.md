# domi-policies

## domi Policy Groups

### AWS

- **S3**: DOMI-AWS-0000 - DOMI-AWS-0099
- **KMS**: DOMI-AWS-0100 - DOMI-AWS-0199
- **Backends**: DOMI-AWS-0200 - DOMI-AWS-0299

## All Policies

| Policy | Level | Description |
| ------ | ----- | ----------- |
| DOMI-AWS-0000 | Warn | No tags founds. |
| DOMI-AWS-0001 | Warn | Empty tags block. |
| DOMI-AWS-0002 | Warn | Access Logging is not configured. |
| DOMI-AWS-0003 | Deny | Reserved for future use. |
| DOMI-AWS-0004 | Deny | Reserved for future use. |
| DOMI-AWS-0005 | Deny | Reserved for future use. |
| DOMI-AWS-0006 | Deny | Reserved for future use. |
| DOMI-AWS-0007 | Deny | S3 Versioning is not enabled. |
| DOMI-AWS-0008 | Deny | S3 Versioning block is empty. |
| DOMI-AWS-0009 | Deny | S3 Versioning block missing. |
| DOMI-AWS-0010 | Deny | S3 Server-side encryption not configured. |
| DOMI-AWS-0011 | Deny | S3 MFA-Delete is not enabled. |
| DOMI-AWS-0100 | Warn | No tags found. |
| DOMI-AWS-0101 | Warn | Empty tags block. |
| DOMI-AWS-0102 | Deny | Key rotation is not enabled. |
| DOMI-AWS-0200 | Deny | Terraform S3 backend encryption is set to false. |
| DOMI-AWS-0201 | Deny | Terraform S3 backend encryption field is missing. |
| DOMI-AWS-0202 | Deny | Terraform backend configuration is missing. |
| DOMI-AWS-0203 | Deny | Possible plain text AWS Access Key found. |
| DOMI-AWS-0204 | Deny | Possible plain text AWS Secret Access Key found. | 
