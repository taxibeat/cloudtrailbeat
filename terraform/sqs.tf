resource "aws_sqs_queue" "cloudtrailbeat" {

  delay_seconds             = 90
  name                        = "${var.sqs_queue_name}.fifo"
  fifo_queue                  = true
  content_based_deduplication = true

  tags = {
    ManagedBy = "Terraform",
    Deployment = "cloudtrailbeat"
  }
}
