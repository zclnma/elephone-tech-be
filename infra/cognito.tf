data "archive_file" "cognito_post_signup_zip" {
  source_file = "./lambda/cognito/postSignup.js"
  output_path = "zip/postSignup.zip"
  type = "zip"
}

data "archive_file" "cognito_auto_confirm_zip" {
  source_file = "./lambda/cognito/autoConfirm.js"
  output_path = "zip/autoConfirm.zip"
  type = "zip"
}

resource "aws_lambda_function" "cognito_post_signup" {
  filename = "cognito_post_signup.zip"
  function_name = "cognito_post_signup"
  handler = "postSignup.js"
  source_code_hash = data.archive_file.cognito_post_signup_zip.output_base64sha256
  runtime = "nodejs12.x"
}

resource "aws_lambda_function" "cognito_auto_confirm" {
  filename = "cognito_auto_confirm.zip"
  function_name = "cognito_auto_confirm"
  handler = "autoConfirm.js"
  source_code_hash = data.archive_file.cognito_auto_confirm_zip.output_base64sha256
  runtime = "nodejs12.x"
}

resource "aws_cognito_user_pool" "user_pool" {
  name = "user_pool"

  password_policy {
    minimum_length = 8
    require_lowercase = true
    require_uppercase = true
    require_numbers = true
  }

  admin_create_user_config {
    allow_admin_create_user_only = false
  }

  lambda_config {
    pre_sign_up = aws_lambda_function.cognito_auto_confirm.arn
    post_confirmation = aws_lambda_function.cognito_post_signup.arn
  }
}

resource "aws_cognito_user_group" "owner" {
  name = "OWNER"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  description = "Owner permission of elephone management"
}

resource "aws_cognito_user_group" "admin" {
  name = "ADMIN"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  description = "Admin permission of elephone management"
}

resource "aws_cognito_user_group" "user" {
  name = "USER"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  description = "User permission of elephone management"
}

resource "aws_cognito_user_pool_client" "client" {
  name = "client"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.client.id
}