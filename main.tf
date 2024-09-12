module "eventbridge_context" {
  source  = "SevenPico/context/null"
  version = "2.0.0"

  id_length_limit = 64
  context         = module.context.self
  enabled         = module.context.enabled
  attributes      = []
}

resource "aws_cloudwatch_event_rule" "event_rule" {
  count          = module.eventbridge_context.enabled ? 1 : 0
  name           = module.eventbridge_context.id
  description    = var.cloudwatch_event_rule_description != "" ? var.cloudwatch_event_rule_description : module.eventbridge_context.id_full
  event_bus_name = var.source_event_bus_name
  event_pattern  = jsonencode(var.cloudwatch_event_rule_pattern)

  tags = module.context.tags
}

resource "aws_cloudwatch_event_target" "event_target" {
  count = module.eventbridge_context.enabled ? 1 : 0

  rule           = try(aws_cloudwatch_event_rule.event_rule[0].name, "")
  target_id      = var.cloudwatch_event_target_id
  arn            = var.cloudwatch_event_target_arn
  role_arn       = var.cloudwatch_event_target_role_arn
  event_bus_name = var.target_event_bus_name
}

