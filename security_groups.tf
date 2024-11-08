## SECURITY GROUPS 
# security group for ec2 access
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow trafiic on port 80"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_http"
  }
}

# security group for acess http
resource "aws_vpc_security_group_ingress_rule" "allow_http_rule" {
  security_group_id = aws_security_group.allow_http.id

  cidr_ipv4   = "10.0.0.0/16"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80

  tags = {
    Name = "allow_http_rule"
  }
}

#security group for ec2 egress
resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
  security_group_id = aws_security_group.allow_http.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
  to_port     = 0
  from_port   = 0

  tags = {
    Name = "allow_all_egress"
  }
}
