provider "aws" {
  region     = "us-west-2"
  profile    = "poc"
}

data "aws_ami" "centos" {
  owners      = ["679593333241"]
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "yyang" {
  count         = 1
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.large"
  key_name      = "yyang-poc.pub"
  root_block_device {
    volume_size = 50
  }

  tags = {
    Name        = "yyang-${count.index + 1}"
  }
}
