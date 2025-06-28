resource "aws_dynamodb_table" "this" {
  provider     = aws
  name         = "${var.project_prefix}-dynamodb-global-table"
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"
  table_class  = "STANDARD"

  attribute {
    name = "id"
    type = "S"
  }

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  replica {
    region_name = var.replica_region
  }

  tags = {
    Name = "${var.project_prefix}-${var.region}-table"
  }
}