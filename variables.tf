variable "env" {
  type     = string
  nullable = false
}

variable "region" {
  type     = string
  nullable = false
}

variable "aws_account_number" {
  type     = string
  nullable = false
}

variable "created_by" {
  type     = string
  nullable = false
}

variable "application" {
  type     = string
  nullable = false
}

variable "omni_bio_rad_notification_emails" {
  type     = string
  nullable = false
}

variable "api_key" {
  type     = string
  nullable = false
}

variable "lbn_send_endpoint" {
  type     = string
  nullable = false
}

variable "lbn_token_endpoint" {
  type     = string
  nullable = false
}

variable "lbn_token_endpoint_request_username" {
  type     = string
  nullable = false
}

variable "lbn_token_endpoint_request_password" {
  type     = string
  nullable = false
}

variable "update_source_db_endpoint" {
  type     = string
  nullable = false
}

variable "omni_wt_get_document_api_url" {
  type     = string
  nullable = false
}

variable "omni_wt_add_document_api_url" {
  type     = string
  nullable = false
}

variable "omni_wt_create_shipment_api_url" {
  type     = string
  nullable = false
}

variable "omni_bio_rad_bill_to_numbers" {
  type     = string
  nullable = false
}

variable "lbn_send_order_events_endpoint" {
  type     = string
  nullable = false
}

variable "lbn_send_billing_invoice_endpoint" {
  type     = string
  nullable = false
}

variable "lbn_token_endpoint_request_authorization" {
  type     = string
  nullable = false
}