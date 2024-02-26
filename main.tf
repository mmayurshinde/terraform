resource "aws_instance" "example" {
  ami           = "ami-04f5097681773b989"
  instance_type = "t2.micro"                
  key_name      = "key-value-terra"

  tags = {
    Name = "LaunchEC2"  
  }
}
