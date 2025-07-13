data "aws_ami" "latest_amazon_ubuntu" {
    most_recent = true
    
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-*-*-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    
    owners = ["099720109477"] # Canonical's AWS account ID for Ubuntu AMIs
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

# Assuming the VPC is already created by some other team and you want to reference it
# data "aws_vpc" "current" {
#     tags = {
#         Name = "us-east-vpc"
#     }
# }

data "aws_availability_zones" "available" {
    state = "available"
}

data "aws_iam_policy_document" "s3_bucket_policy" {
    statement {
        sid = "PublicReadGetObject"
        effect = "Allow"
        actions = ["s3:GetObject"]
        resources = ["arn:aws:s3:::rk-udemy-us-east-bucket/*"]
        principals {
            type = "AWS"
            identifiers = ["*"]
        }
    }
}
