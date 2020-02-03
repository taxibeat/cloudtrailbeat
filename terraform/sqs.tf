resource "aws_sqs_queue" "cloudtrailbeat" {

  delay_seconds             = 90
  name                        = "${var.sqs_queue_name}"
  fifo_queue                  = false
  content_based_deduplication = false

  tags = {
    ManagedBy = "Terraform",
    Deployment = "cloudtrailbeat"
  }
}

data "aws_caller_identity" "current" {}

locals {
  sqs_http_address = "https://sqs.us-east-1.amazonaws.com/${data.aws_caller_identity.current.account_id}/${aws_sqs_queue.cloudtrailbeat.name}"
}