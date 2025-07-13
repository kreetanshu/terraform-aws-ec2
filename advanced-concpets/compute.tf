resource "aws_instance" "web" {
  #"ami-020cba7c55df1f615"
  ami                         = data.aws_ami.latest_amazon_ubuntu.id # Example AMI ID, replace with a valid one
  instance_type               = var.aws_instance_type
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.us_east_subnet.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = var.aws_ebs_config.size
    volume_type           = var.aws_ebs_config.type
  }
  
  tags = merge(local.tags, var.additional_tags, {
    Name = "ec2-resource"
  })

  lifecycle {
    create_before_destroy = true
    ignore_changes = [ tags ]
  }
}

resource "aws_security_group" "public_http_traffic" {
  name        = "public_http_traffic"
  description = "Security group for HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.us_east_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, {
    Name = "public_http_traffic"
  })

}