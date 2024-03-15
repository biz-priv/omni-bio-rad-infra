resource "aws_dynamodb_table" "omni-bio-rad-logs-table" {
  name             = "omni-bio-rad-logs-${var.env}"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "Id"
  stream_enabled   = false
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "Id"
    type = "S"
  }
  attribute {
    name = "FreightOrderId"
    type = "S"
  }

  attribute {
    name = "Housebill"
    type = "S"
  }

  global_secondary_index {
    name            = "FreightOrderId-Index"
    hash_key        = "FreightOrderId"
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "Housebill-Index"
    hash_key        = "Housebill"
    projection_type = "ALL"
  }

  tags = {
    Application = "Omni Bio Rad Api Services"
    CreatedBy   = "BizCloudExperts"
    Environment = var.env
  }
}
