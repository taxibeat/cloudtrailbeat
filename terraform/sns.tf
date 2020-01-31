resource "aws_sns_topic" "cloudtrailbeat" {

  name = "${var.sns_topic_name}"
  display_name = "${var.sns_display_name}"

  # tags = {
  #   ManagedBy = "Terraform",
  #   Deployment = "cloudtrailbeat"
  # }
}

resource "aws_sns_topic_subscription" "cloudtrailbeat_sqs_target" {
  topic_arn = "${aws_sns_topic.cloudtrailbeat.arn}"
  protocol  = "sqs"
  endpoint  = "${aws_sqs_queue.cloudtrailbeat.arn}"
}
