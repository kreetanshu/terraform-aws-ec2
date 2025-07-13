variable "subnet_count" {
  type        = number
  default     = 2
  description = "Number of subnets to create in the VPC"
}

variable "ec2_config_map" {
  type = map(object({
    instance_type = string
    root_block_device = object({
      delete_on_termination = bool
      volume_size           = number
      volume_type           = string
    })
  }))

  validation {
    condition = contains(["t2.micro", "t3.micro"], var.ec2_config_map["ubuntu"].instance_type) && contains(["t2.micro", "t3.micro"], var.ec2_config_map["nginx"].instance_type)
    error_message = "Instance type must be one of the following: t2.micro, t3.micro"
  }
}