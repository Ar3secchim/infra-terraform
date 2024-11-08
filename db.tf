# DB SUBNET GROUP
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.subnet-database-a.id, aws_instance.ec2-zona-b.id, aws_instance.ec2-zona-c.id]

  tags = {
    Name = "db-subnet-group"
  }
}

# DB INSTANCE 
resource "aws_rds_cluster" "db_cluster" {
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  engine               = "mysql"
  availability_zones   = ["us-east-1a", "us-east-2a", "us-east-1c"]

  master_password = var.DB_PASSWORD
  master_username = var.DB_USERNAME

  tags = {
    Name = "db_mysql"
  }
}
