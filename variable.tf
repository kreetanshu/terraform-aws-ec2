variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}
variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "aws_ami" {
  description = "The AMI to use for the EC2 instance"
  type        = string 
}

variable "aws_instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}

variable "aws_key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

variable "aws_security_group" {
  description = "The name of the security group to associate with the EC2 instance"
  type        = string
}

variable "aws_instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  default     = "my_ec2_instance"
}

variable "aws_environment" {
  description = "The environment for the EC2 instance (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}