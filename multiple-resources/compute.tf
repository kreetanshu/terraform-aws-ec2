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

data "aws_ami" "nginx" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-nginx-1.25.4-*-linux-debian-12-x86_64-hvm-ebs-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "multiple_resources" {
  for_each = var.ec2_config_map
  ami = data.aws_ami.latest_amazon_ubuntu.id
  instance_type = each.value.instance_type

  root_block_device {
    delete_on_termination = each.value.root_block_device.delete_on_termination
    volume_size = each.value.root_block_device.volume_size
    volume_type = each.value.root_block_device.volume_type
  }

  lifecycle {
    create_before_destroy = false
    ignore_changes = [tags]
  }

  tags = {
    Name = "${each.key}-instance"
    Environment = "production"
  }

}   