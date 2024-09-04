module "example_sns_kms_key" {
  source  = "SevenPicoForks/kms-key/aws"
  version = "2.0.0"
  context = module.example_context.self

  attributes               = ["sns"]
  alias                    = ""
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  deletion_window_in_days  = 9
  key_usage                = "ENCRYPT_DECRYPT"
  multi_region             = false
}

module "sns" {
  source  = "SevenPico/sns/aws"
  version = "2.0.2"
  context = module.example_context.self

  kms_master_key_id = module.example_sns_kms_key.key_id
  pub_principals    = {}
  sub_principals    = {}
}
