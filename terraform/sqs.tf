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
