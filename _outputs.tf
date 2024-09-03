output "aws_cloudwatch_event_rule_id" {
  description = "The name of the rule"
  value       = try(aws_cloudwatch_event_rule.event_rule[0].id, "")
}

output "aws_cloudwatch_event_rule_arn" {
  description = "The Amazon Resource Name (ARN) of the rule."
  value       = try(aws_cloudwatch_event_rule.event_rule[0].arn, "")
}
