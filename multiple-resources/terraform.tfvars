subnet_count = 2

ec2_config_map = {
  "ubuntu" = {
    instance_type = "t2.micro"
    #ami_id               = data.aws_ami.latest_amazon_ubuntu.id # Example AMI ID, replace with a valid one
    root_block_device = {
      delete_on_termination = true
      volume_size           = 10
      volume_type           = "gp3"
    }
  }
  nginx = {
    instance_type = "t2.micro"
    #ami_id               = data.aws_ami.nginx.id # Example AMI ID, replace with a valid one
    root_block_device = {
      delete_on_termination = true
      volume_size           = 10
      volume_type           = "gp3"
    }
  }
}