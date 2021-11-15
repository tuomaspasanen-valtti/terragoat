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
    git_commit           = "34da3f7d3471fab6b0604b12df74746fbb6b7ce5"
    git_file             = "ec2.tf"
    git_last_modified_at = "2021-11-15 11:55:38"
    git_last_modified_by = "32462260+porec@users.noreply.github.com"
    git_modifiers        = "32462260+porec"
    git_org              = "porec"
    git_repo             = "terragoat"
    yor_trace            = "3a1763ed-f6d8-4cb1-9d29-261e4df1ee27"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "34da3f7d3471fab6b0604b12df74746fbb6b7ce5"
    git_file             = "ec2.tf"
    git_last_modified_at = "2021-11-15 11:55:38"
    git_last_modified_by = "32462260+porec@users.noreply.github.com"
    git_modifiers        = "32462260+porec"
    git_org              = "porec"
    git_repo             = "terragoat"
    yor_trace            = "dba6a3e5-494c-4d12-99e2-33d350c960fc"
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
