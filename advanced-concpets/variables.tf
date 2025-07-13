variable "aws_instance_type" {
  description = "Type of AWS instance to use"
  type        = string
  default     = "t2.micro"
  
  validation {
    condition = contains(["t2.micro","t3.micro"], var.aws_instance_type)
    error_message = "value must be one of the following: t2.micro, t3.micro"
  }

}

variable "aws_ebs_config"{
    description = "value for EBS volume configuration"
    type = object({
       size = number
       type = string
    })
    default = {
        size = 10
        type = "gp3"
    }
}

variable "additional_tags" {
    description = "value for additional tags to be applied to resources"
    type = map(string)
    default = {
        "owner" = "Reetanshu Kumar"
    }
}