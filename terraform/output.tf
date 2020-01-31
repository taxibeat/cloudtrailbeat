output "sns_topic_arn" {
  value = "${aws_sns_topic.cloudtrailbeat.arn}"
}

output "sqs_topic_arn" {
  value = "${aws_sqs_queue.cloudtrailbeat.arn}"
}

output "k8s_cloudtrailbeat_iam_role_arn" {
  value = "${aws_iam_policy.cloudtrailbeat.arn}"
}