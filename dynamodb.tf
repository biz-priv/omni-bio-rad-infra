resource "aws_dynamodb_table" "omni-bio-rad-logs-table" {
  name             = "omni-bio-rad-logs-${var.env}"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "Id"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "Id"
    type = "S"
  }
  attribute {
    name = "FreightOrderId"
    type = "S"
  }

  global_secondary_index {
    name            = "FreightOrderId-Index"
    hash_key        = "FreightOrderId"
    projection_type = "ALL"
  }

  tags = {
    Name = "omni-bio-rad-logs-${var.env}"
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}
