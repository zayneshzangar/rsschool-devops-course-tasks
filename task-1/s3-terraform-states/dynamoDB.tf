# Create dynamoDB table for LockID

resource "aws_dynamodb_table" "statelock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  hash_key = "LockID"
}