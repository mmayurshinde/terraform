resource "aws_instance" "example" {
  ami           = "ami-04f5097681773b989"
  instance_type = "t2.micro"                
  key_name      = "key-value-terra"


provider "aws" {
  region     = "ap-southeast-2"
#  access_key = "${env.AWS_ACCESS_KEY_ID}"
#  secret_key = "${env.AWS_SECRET_ACCESS_KEY}"
}


  tags = {
    Name = "LaunchEC2"  
  }
}
