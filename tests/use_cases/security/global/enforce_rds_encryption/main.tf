# Create rds cluster and instance with encryption disabled

resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-postgresql"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  master_username         = "foo"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  storage_encrypted  = false
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  identifier         = "aurora-cluster-instance-demo"
  cluster_identifier = aws_rds_cluster.postgresql.id
  instance_class     = "db.r4.large"
  engine             = aws_rds_cluster.postgresql.engine
  engine_version     = aws_rds_cluster.postgresql.engine_version
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
