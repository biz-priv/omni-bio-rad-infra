resource "aws_sqs_queue" "omni_bio_rad_send_order_events_sqs" {
  name                      = "omni-bio-rad-send-order-events-sqs"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  visibility_timeout_seconds = 900
  receive_wait_time_seconds = 0
}