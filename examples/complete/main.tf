
module "example_context" {
  source     = "registry.terraform.io/SevenPico/context/null"
  version    = "2.0.0"
  context    = module.context.self
  enabled    = module.context.enabled
  attributes = []
}
locals {
  sns_topic_allowed_aws_services_for_sns_published = ["events.amazonaws.com"]

  cloudwatch_event_rule_description = "This is event rule description."
  cloudwatch_event_rule_pattern = {
    source = ["aws.health"],
    detail-type = ["AWS Health Event"],
    detail = {
      service = ["EC2"],
      eventTypeCategory = ["issue"]
    }
  }
}
module "sns" {
  source  = "SevenPico/sns/aws"
  version = "2.0.2"
  context = module.context.self
}

module "cloudwatch_event" {
  source = "../../"
  context =  module.example_context.self

  cloudwatch_event_rule_pattern     = local.cloudwatch_event_rule_pattern
  cloudwatch_event_rule_description = local.cloudwatch_event_rule_description
  cloudwatch_event_target_arn       = module.sns.topic_arn
}
