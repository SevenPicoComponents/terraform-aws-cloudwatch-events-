module "example_context" {
  source     = "registry.terraform.io/SevenPico/context/null"
  version    = "2.0.0"
  context    = module.context.self
  enabled    = module.context.enabled
  attributes = []
}

module "sns" {
  source  = "SevenPico/sns/aws"
  version = "2.0.2"
  context = module.context.self
}

module "cloudwatch_event" {
  source = "../../"
  context =  module.example_context.self
  cloudwatch_event_rule_description = var.cloudwatch_event_rule_description
  cloudwatch_event_rule_pattern     = var.cloudwatch_event_rule_pattern
  cloudwatch_event_target_arn       = module.sns.topic_arn
}
