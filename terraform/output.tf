output "sns_topic_arn" {
  value = "${aws_sns_topic.cloudtrailbeat.arn}"
}

output "sqs_topic_arn" {
  value = ""
}

output "sqs_queue_arn" {
  value = "${aws_sqs_queue.cloudtrailbeat.arn}"
}

output "iam_role_arn" {
  value = "${aws_iam_role.cloudtrailbeat.arn}"
}

output "sqs_queue_url" {
  value = "${local.sqs_http_address}"
}