# terraform-aws-cloudwatch-events [![Latest Release](https://img.shields.io/github/release/sevenpicocomponents/terraform-aws-cloudwatch-events.svg)](https://github.com/sevenpicocomponents/terraform-aws-cloudwatch-events/releases/latest)

This is `terraform-aws-cloudwatch-events` module that creates CloudWatch Events rules and according targets.
> Amazon CloudWatch Events delivers a near real-time stream of system events that describe changes in Amazon Web Services (AWS) resources. Using simple rules that you can quickly set up, you can match events and route them to one or more target functions or streams. CloudWatch Events becomes aware of operational changes as they occur. CloudWatch Events responds to these operational changes and takes corrective action as necessary, by sending messages to respond to the environment, activating functions, making changes, and capturing state information.

## Usage

Here's how to invoke this example module in your projects

```hcl
module "cloudwatch_event" {
  source = "sevenpicocomponents/cloudwatch-events/aws"
  version = "0.7.0"

  name          = var.name
  namespace     = var.namespace
  tenant        = var.tenant
  environment   = var.environment
  stage         = var.stage

  cloudwatch_event_rule_description = var.cloudwatch_event_rule_description
  cloudwatch_event_rule_pattern = var.cloudwatch_event_rule_pattern_json
  cloudwatch_event_target_arn = module.sns.sns_topic.arn
}
```

> [!IMPORTANT]
> In our examples, we avoid pinning modules to specific versions to prevent discrepancies between the documentation
> and the latest released versions. However, for your own projects, we strongly advise pinning each module to the exact version
> you're using. This practice ensures the stability of your infrastructure. Additionally, we recommend implementing a systematic
> approach for updating versions to avoid unexpected changes.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rule_label"></a> [rule\_label](#module\_rule\_label) | sevenpicocomponents/label/null | 0.25.0 |
| <a name="module_this"></a> [this](#module\_this) | sevenpicocomponents/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | n/a | yes |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | Tenant, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, e.g. 'prod', 'staging', 'dev', 'UAT' | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | n/a | yes |
| <a name="input_cloudwatch_event_rule_description"></a> [cloudwatch\_event\_rule\_description](#input\_cloudwatch\_event\_rule\_description) | Description of the CloudWatch Event rule | `string` | n/a | yes |
| <a name="input_cloudwatch_event_rule_pattern"></a> [cloudwatch\_event\_rule\_pattern](#input\_cloudwatch\_event\_rule\_pattern) | Event pattern described a JSON object | `string` | n/a | yes |
| <a name="input_cloudwatch_event_target_arn"></a> [cloudwatch\_event\_target\_arn](#input\_cloudwatch\_event\_target\_arn) | The ARN of the target to be used for the CloudWatch Event rule | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_cloudwatch_event_rule_arn"></a> [aws\_cloudwatch\_event\_rule\_arn](#output\_aws\_cloudwatch\_event\_rule\_arn) | The Amazon Resource Name (ARN) of the rule. |
| <a name="output_aws_cloudwatch_event_rule_id"></a> [aws\_cloudwatch\_event\_rule\_id](#output\_aws\_cloudwatch\_event\_rule\_id) | The name of the rule |

## Related Projects

Check out these related projects.

- [terraform-aws-sns-topic](https://github.com/sevenpicocomponents/terraform-aws-sns-topic) - Terraform Module to Provide an Amazon Simple Notification Service (SNS)
- [terraform-aws-sns-cloudwatch-sns-alarms](https://github.com/sevenpicocomponents/terraform-aws-sns-cloudwatch-sns-alarms) - Terraform module that configures CloudWatch SNS alerts for SNS

## References

For additional context, refer to some of these links.

- [What Is Amazon CloudWatch Events?](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/WhatIsCloudWatchEvents.html) - AWS CloudWatch Events documentation.
- [Terraform `aws_cloudwatch_event_rule` Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) - Provides a CloudWatch Event Rule resource.
- [Terraform `aws_cloudwatch_event_target` Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) - Provides a CloudWatch Event Target resource.

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

```text
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
```
