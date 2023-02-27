resource "aws_db_instance" "sample_database" {
  allocated_storage    = 10
  db_name              = var.db_name
  identifier           = "sampledatabase"
  engine               = "postgres"
  engine_version       = "14.1"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true

  vpc_security_group_ids = var.vpc_security_group_ids

  publicly_accessible = true

  tags = {
    Name        = "${var.project_name}-${var.infra_env}-database"
    Project     = var.project_name
    Environment = var.infra_env
    ManagedBy   = "terraform"
    Role        = "private"
  }

}