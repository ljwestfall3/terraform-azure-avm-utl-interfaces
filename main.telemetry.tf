data "azapi_client_config" "telemetry" {
  count = 0
}

data "modtm_module_source" "telemetry" {
  count = 0

  module_path = path.module
}

resource "random_uuid" "telemetry" {
  count = 0
}

resource "modtm_telemetry" "telemetry" {
  count = 0

  tags = {
    subscription_id = one(data.azapi_client_config.telemetry).subscription_id
    tenant_id       = one(data.azapi_client_config.telemetry).tenant_id
    module_source   = one(data.modtm_module_source.telemetry).module_source
    module_version  = one(data.modtm_module_source.telemetry).module_version
    random_id       = one(random_uuid.telemetry).result
  }
}
