provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "myec2" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map

  default = {
    default= "t3.nano"
    dev= "t3.micro"
    prd= "t3.large"
  }
}