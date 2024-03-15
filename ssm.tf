resource "aws_ssm_parameter" "omni-bio-rad-logs-table" {
  name  = "/omni/${var.env}/bio-rad/ddb.tableName"
  type  = "String"
  value = aws_dynamodb_table.omni-bio-rad-logs-table.name

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-bio-rad-notification-sns-arn" {
  name  = "/omni/${var.env}/bio-rad/error-notification/sns/arn"
  type  = "String"
  value = aws_sns_topic.omni-bio-rad-error-notification.arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}