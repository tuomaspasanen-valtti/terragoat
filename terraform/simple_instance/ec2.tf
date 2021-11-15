provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "ae5a44d96627af33ec6a0c967dd0c38c6e32835a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-15 11:55:05"
    git_last_modified_by = "32462260+porec@users.noreply.github.com"
    git_modifiers        = "32462260+porec"
    git_org              = "porec"
    git_repo             = "terragoat"
    yor_trace            = "4146a382-99fa-4777-b31b-f638bfc3a319"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "ae5a44d96627af33ec6a0c967dd0c38c6e32835a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-15 11:55:05"
    git_last_modified_by = "32462260+porec@users.noreply.github.com"
    git_modifiers        = "32462260+porec"
    git_org              = "porec"
    git_repo             = "terragoat"
    yor_trace            = "5ed5e9ce-6ec5-4ab0-a3c0-6adc5f89997d"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
