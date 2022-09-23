########################################
##### Security Groupe to Access to Web Server ###
########################################

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = aws_vpc.vpc.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
