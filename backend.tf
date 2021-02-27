terraform {
  backend "s3" {
    bucket = "tfstate270220210001"
    key    = "practice/ec2/state"
    region = "us-east-1"
  }
}
