# terraform-aws-ec2

Terraform project to create EC2 VM in AWS

Define your AWS specific variables details in `terraform.tfvars` file.

## Steps to terraform

1. Initialise terraform, validate and check the plan
```bash
terraform init
terraform validate
terraform plan
```
2. Run the terraform apply command to create resources

```bash
terraform apply
```
3. Save the instance IP and public IP from terraform output

```bash
terraform output -json >> tfoutput.json
```

