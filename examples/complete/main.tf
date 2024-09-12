
module "example_context" {
  source     = "registry.terraform.io/SevenPico/context/null"
  version    = "2.0.0"
  context    = module.context.self
  enabled    = module.context.enabled
  attributes = []
}

module "cloudwatch_event" {
  source = "../../"
  context =  module.example_context.self

  cloudwatch_event_rule_pattern     = {
    source = ["aws.health"],
    detail-type = ["AWS Health Event"],
    detail = {
      service = ["EC2"],
      eventTypeCategory = ["issue"]
    }
  }
  cloudwatch_event_rule_description = "This is event rule description."
  cloudwatch_event_target_arn       = module.sns.topic_arn
}
