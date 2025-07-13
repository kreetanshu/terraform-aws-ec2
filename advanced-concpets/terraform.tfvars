# terraform.tfvars file allows you to set variables for your Terraform configuration.
aws_instance_type = "t2.micro"
aws_ebs_config = {
  size = 15
  type = "gp3"
}
additional_tags = {
  owner = "Reetanshu Kumar"
}
