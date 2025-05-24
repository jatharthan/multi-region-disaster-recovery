resource "aws_dynamodb_table" "this" {
  provider = aws
  name     = "${var.project_prefix}-${var.region}-table"
  hash_key = "id"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }

  replica {
    region_name = var.replica_region
  }

  tags = {
    Name = "${var.project_prefix}-${var.region}-table"
  }
}