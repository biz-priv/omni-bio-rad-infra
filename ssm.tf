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

resource "aws_ssm_parameter" "omni-bio-rad-api-key-arn" {
  name  = "/omni/${var.env}/bio-rad/api-key"
  type  = "SecureString"
  value = var.api_key

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-bio-rad-lbn-send-endpoint" {
  name  = "/omni/${var.env}/bio-rad/lbn-send-endpoint"
  type  = "String"
  value = var.lbn_send_endpoint

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-bio-rad-lbn-token-endpoint" {
  name  = "/omni/${var.env}/bio-rad/lbn-token-endpoint"
  type  = "String"
  value = var.lbn_token_endpoint

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-bio-rad-lbn-token-endpoint-username" {
  name  = "/omni/${var.env}/bio-rad/lbn-token-endpoint/username"
  type  = "String"
  value = var.lbn_token_endpoint_request_username

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-bio-rad-lbn-token-endpoint-password" {
  name  = "/omni/${var.env}/bio-rad/lbn-token-endpoint/password"
  type  = "SecureString"
  value = var.lbn_token_endpoint_request_password

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-bio-rad-lbn-token-endpoint-authorization" {
  name  = "/omni/${var.env}/bio-rad/lbn-token-endpoint/authorization"
  type  = "SecureString"
  value = var.lbn_token_endpoint_request_authorization

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-bio-rad-update-source-db-endpoint" {
  name  = "/omni/${var.env}/bio-rad/update-source-db-endpoint"
  type  = "String"
  value = var.update_source_db_endpoint

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-bio-rad-logs-table-streamArn" {
  name  = "/omni/${var.env}/bio-rad/ddb.streamArn"
  type  = "SecureString"
  value = aws_dynamodb_table.omni-bio-rad-logs-table.stream_arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-wt-get-document-api-url" {
  name  = "/omni/${var.env}/bio-rad/wt/get-document/api.url"
  type  = "String"
  value = var.omni_wt_get_document_api_url

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-wt-add-document-api-url" {
  name  = "/omni/${var.env}/bio-rad/wt/add-document/api.url"
  type  = "String"
  value = var.omni_wt_add_document_api_url

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-wt-create-shipment-api-url" {
  name  = "/omni/${var.env}/bio-rad/wt/create-shipment/api.url"
  type  = "String"
  value = var.omni_wt_create_shipment_api_url

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_ssm_parameter" "omni-send-order-events-sqs-url" {
  name  = "/omni/${var.env}/bio-rad/send-order-events/sqs.arn"
  type  = "String"
  value = aws_sqs_queue.omni_bio_rad_send_order_events_sqs.arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}