Terraform provider
A provider is a plugin that terreform intrect with the platform like aws,gcp

provider "aws" {
  region = "us-east-1"
}

Terraform Block
A block is a conatiner for configuration ,everything in terraform will written in block 

common block type
provider block
resource block
data block
output block
variable block

resource "aws_instance" "my_ec2" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}

Argument in Terraform
An argument is a key-value pair inside a block that defines configuration.
ami           = "ami-123456"
instance_type = "t2.micro"
