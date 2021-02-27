module "ec2_web" {
  source          = "./modules/ec2-linux-ubuntu"
  instance_type   = "t2.micro"
  public_ip       = true
  subnet_id       = aws_subnet.compute_subnet.id
  security_groups = [aws_security_group.green_security_group.id]
}

module "ec2_db" {
  source          = "./modules/ec2-linux-ubuntu"
  instance_type   = "t2.micro"
  public_ip       = true
  subnet_id       = aws_subnet.compute_subnet.id
  security_groups = [aws_security_group.green_security_group.id]
}

output "web_ec2_public_ip" {
  description = "Public IP address of the Web EC2 instance"
  value       = module.ec2_web.public_ip
}

output "db_ec2_public_ip" {
  description = "Public IP address of the Web EC2 instance"
  value       = module.ec2_db.public_ip
}
