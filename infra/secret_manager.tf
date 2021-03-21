resource "aws_secretsmanager_secret" "database_password_secret" {
  name = "database_password_secret"
  description = "Database password"
}