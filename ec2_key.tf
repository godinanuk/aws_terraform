resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
  public_key = file(var.ec2_key_pair_name) 
}
