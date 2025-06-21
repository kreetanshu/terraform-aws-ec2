
resource "aws_instance" "ec2_vm" {
    ami = var.aws_ami
    instance_type = var.aws_instance_type
    key_name = var.aws_key_name
    security_groups = [aws_security_group.basic-ssh-http.name]
    tags = {
        Name = var.aws_instance_name
        Environment = var.aws_environment
    }
}

resource "aws_security_group" "basic-ssh-http" {
    name = "allow_ssh_http"
    description = "Allow SSH and HTTP traffic"

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        description = "Allow all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow_ssh_http"
    }
}