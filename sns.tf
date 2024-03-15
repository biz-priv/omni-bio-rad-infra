resource "aws_sns_topic" "omni-bio-rad-error-notification" {
  name = "omni-bio-rad-error-notification-${var.env}"

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

resource "aws_sns_topic_subscription" "omni_bio_rad_emails_subscription" {
  for_each  = { for idx, email in var.omni_bio_rad_notification_emails : idx => email }
  topic_arn = aws_sns_topic.omni-bio-rad-error-notification.arn
  protocol  = "email"
  endpoint  = each.value
}
