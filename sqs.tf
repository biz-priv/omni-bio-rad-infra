resource "aws_sqs_queue" "omni_bio_rad_send_order_events_sqs" {
  name                      = "omni-bio-rad-send-order-events-${var.env}"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  visibility_timeout_seconds = 900
  receive_wait_time_seconds = 0
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