data "aws_subnets" "subnets" {
  filter {
    name   = "tag:Name"
    values = ["subnet-private-*"]
  }
}

# aws_instance ec2 
resource "aws_instance" "ec2-instance" {
  for_each = toset(data.aws_subnets.subnets.ids)

  ami               = "ami-063d43db0594b521b"
  instance_type     = var.INSTANCE_TYPE_EC2
  subnet_id         = each.value
  availability_zone = each.value.availability_zone

  vpc_security_group_ids = [aws_security_group.allow_http.id]

  depends_on = [aws_route_table.route-public]
  tags = {
    Name = "ExampleInstance-${each.key}"
  }
}
