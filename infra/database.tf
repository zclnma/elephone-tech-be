resource "random_password" "db" {
  length = 0
}

resource "aws_rds_cluster" "elephone_db_cluster" {
  cluster_identifier = "elephone-db-cluster"
  engine = "aurora-postgresql"
  engine_version = "10.11"
  engine_mode = "serverless"
  master_username = "dbadmin"
}