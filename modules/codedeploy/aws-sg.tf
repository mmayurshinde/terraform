resource "aws_security_group" "allow_tls" {
  name        = "securityg1"
  description = "Allow TLS inbound traffic and all outbound traffic"

  dynamic "ingress" {

    for_each = [22, 80, 443, 3306]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
