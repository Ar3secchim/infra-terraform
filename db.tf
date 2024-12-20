# DB SUBNET GROUP
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.subnet-database-a.id, aws_subnet.subnet-database-b.id, aws_subnet.subnet-database-c.id]
  tags = {
    Name = "db-subnet-group"
  }
}

# DB INSTANCE 
resource "aws_rds_cluster" "db_cluster" {
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

  engine             = "mysql"
  cluster_identifier = "db-cluster-mysql"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

  db_cluster_instance_class = "db.c6gd.medium"
  storage_type              = "io1"
  allocated_storage         = 400
  iops                      = 3000

  master_password = var.DB_PASSWORD
  master_username = var.DB_USERNAME

  tags = {
    Name = "db_mysql"
  }
}
