# AWS Infrastructure as code(IaC) automation using Terraform

Terraform project to create resources like VPC, Subnet, Internet Gateway, Route Table, EC2 and Security Groups in AWS. 

This project also explains advanced concepts like datasource, alias, varriables validations, parameterising ec2 blocks using terraform.tfvars, running multiple iterations of resource creation using count and map object iterations.

## Pre-requisite:
Install AWS CLI and perform AWS configuration or define user specific AWS variables details in `terraform.tfvars` file to authenticate to AWS. This step has been removed due to security considerations.

YouTube Video Install and Configure AWS CLI: [Link](https://www.youtube.com/watch?v=vZXpmgAs91s)

## Steps to terraform

1. Navigate to the correct folder, initialise terraform, validate and check the plan
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

