resource "aws_sqs_queue" "omni_bio_rad_send_order_events_sqs" {
  name                       = "omni-bio-rad-send-order-events-${var.env}"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600
  visibility_timeout_seconds = 900
  receive_wait_time_seconds  = 0
}

data "aws_iam_policy_document" "omni_bio_rad_send_order_events_queue_policy" {
  policy_id = "${aws_sqs_queue.omni_bio_rad_send_order_events_sqs.arn}/SQSDefaultPolicy"
  statement {
    sid    = "Allow SNS publish to SQS"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "SQS:SendMessage",
    ]
    resources = [
      aws_sqs_queue.omni_bio_rad_send_order_events_sqs.arn
    ]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-milestone-${var.env}",
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-apar-failure-${var.env}",
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-dw-shipment-location-updates-${var.env}"
      ]
    }
  }
}

resource "aws_sqs_queue_policy" "omni_bio_rad_send_order_events_queue_policy" {
  queue_url = aws_sqs_queue.omni_bio_rad_send_order_events_sqs.id
  policy    = data.aws_iam_policy_document.omni_bio_rad_send_order_events_queue_policy.json
}

resource "aws_sns_topic_subscription" "omni_shipment_milestone_stream_sns_subscription" {
  topic_arn = "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-milestone-${var.env}"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.omni_bio_rad_send_order_events_sqs.arn
}

resource "aws_sns_topic_subscription" "omni_apar_failure_stream_sns_subscription" {
  topic_arn = "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-apar-failure-${var.env}"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.omni_bio_rad_send_order_events_sqs.arn
}

resource "aws_sns_topic_subscription" "omni_shipment_location_updates_sns_subscription" {
  topic_arn = "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-dw-shipment-location-updates-${var.env}"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.omni_bio_rad_send_order_events_sqs.arn

  filter_policy = jsonencode(
    {
      BillNo = [
        "8061",
        "8062",
      ]
    }
  )
}

resource "aws_sqs_queue" "omni_bio_rad_send_billing_invoice_sqs" {
  name                       = "omni-bio-rad-send-billing-invoice-${var.env}"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600
  visibility_timeout_seconds = 900
  receive_wait_time_seconds  = 0
}

data "aws_iam_policy_document" "omni_bio_rad_send_billing_invoice_queue_policy" {
  policy_id = "${aws_sqs_queue.omni_bio_rad_send_billing_invoice_sqs.arn}/SQSDefaultPolicy"
  statement {
    sid    = "Allow SNS publish to SQS"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "SQS:SendMessage",
    ]
    resources = [
      aws_sqs_queue.omni_bio_rad_send_billing_invoice_sqs.arn
    ]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-wt-rt-shipment-apar-${var.env}"
      ]
    }
  }
}

resource "aws_sqs_queue_policy" "omni_bio_rad_send_billing_invoice_queue_policy" {
  queue_url = aws_sqs_queue.omni_bio_rad_send_billing_invoice_sqs.id
  policy    = data.aws_iam_policy_document.omni_bio_rad_send_billing_invoice_queue_policy.json
}