# AWS Infrastructure as code(IaC) automation using Terraform

Terraform project to create resources like EC2 and security groups in AWS

Define user specific AWS variables details in `terraform.tfvars` file.

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

