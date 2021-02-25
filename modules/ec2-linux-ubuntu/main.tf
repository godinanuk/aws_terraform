data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = var.instance_type 
  key_name = "ec2_key"
  security_groups = var.security_groups 
  associate_public_ip_address = var.public_ip 
  subnet_id = var.subnet_id

  credit_specification {
    cpu_credits = "unlimited"
  }
}
