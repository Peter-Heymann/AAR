locals {
  apim_instances = [
    {
      name                          = "apim-instance-1"
      rg_name                       = "rg-example"
      location                      = "East US"
      tags                          = { environment = "dev" }
      sku_name                      = "Developer_1"
      publisher_name                = "Example Publisher"
      publisher_email               = "publisher@example.com"
      client_cetuficate_enabled     = false
      gateway_disabled              = false
      min_api_version               = "2021-08-01"
      public_ip_address_id          = "/subscriptions/xxxx/resourceGroups/rg-example/providers/Microsoft.Network/publicIPAddresses/example-ip"
      public_network_access_enabled = true
      virtual_network_type          = "None"

      additional_location = []

      certificate = []

      hostname_configuration = {}

      delegation = null

      sign_in = {
        enabled = true
      }

      sign_up = {
        enabled = true
        terms_of_service = {
          enabled          = true
          consent_required = true
          text             = "Please accept the terms."
        }
      }

      security = {
        enable_backend_ssl30                                = false
        enable_backend_tls10                                = false
        enable_backend_tls11                                = false
        enable_frontend_ssl30                               = false
        enable_frontend_tls10                               = false
        enable_frontend_tls11                               = false
        tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = true
        tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = true
        tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = true
        tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = true
        tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = true
        tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = true
        tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = true
        tls_rsa_with_aes256_gcm_sha384_ciphers_enabled      = true
        tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = true
        tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = true
        triple_des_ciphers_enabled                          = false
      }

      identity_type = "SystemAssigned"
      identity_ids  = []
    }
  ]
}

#-----------------------------------------------------------------------
# API-Management
#-----------------------------------------------------------------------

module "apim" {
  source = "./apim_module"

  apim_instances = [
    {
      name                          = "apim-instance-1"
      rg_name                       = "rg-example"
      location                      = "East US"
      tags                          = { environment = "dev" }
      sku_name                      = "Developer_1"
      publisher_name                = "Example Publisher"
      publisher_email               = "publisher@example.com"
      client_cetuficate_enabled     = false
      gateway_disabled              = false
      min_api_version               = "2021-08-01"
      public_ip_address_id          = "/subscriptions/xxxx/resourceGroups/rg-example/providers/Microsoft.Network/publicIPAddresses/example-ip"
      public_network_access_enabled = true
      virtual_network_type          = "None"

      additional_location = []
      certificate = []
      hostname_configuration = {}
      delegation = null

      sign_in = {
        enabled = true
      }

      sign_up = {
        enabled = true
        terms_of_service = {
          enabled          = true
          consent_required = true
          text             = "Please accept the terms."
        }
      }

      security = {
        enable_backend_ssl30                                = false
        enable_backend_tls10                                = false
        enable_backend_tls11                                = false
        enable_frontend_ssl30                               = false
        enable_frontend_tls10                               = false
        enable_frontend_tls11                               = false
        tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = true
        tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = true
        tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = true
        tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = true
        tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = true
        tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = true
        tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = true
        tls_rsa_with_aes256_gcm_sha384_ciphers_enabled      = true
        tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = true
        tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = true
        triple_des_ciphers_enabled                          = false
      }

      identity_type = "SystemAssigned"
      identity_ids  = []
    }
  ]
}


#-----------------------------------------------------------------------
# API-Management - API
#-----------------------------------------------------------------------

module "apimapi_instance" {
  source                = "value"
  id                    = "/subscriptions/xxxx/resourceGroups/rg-example/providers/Microsoft.ApiManagement/service/apim-example/apis/api1"
  name                  = "api1"
  resource_group_name   = "rg-example"
  api_management_name   = "apim-example"
  display_name          = "Example API 1"
  path                  = "example1"
  protocols             = ["https"]
  service_url           = "https://example1.com"
  subscription_required = true
  import = {
    content_format = "swagger-link-json"
    content_value  = "https://example1.com/swagger.json"
  }
  contact = {
    name  = "API Owner"
    email = "owner@example.com"
    url   = "https://example1.com/contact"
  }
  license = {
    name = "MIT"
    url  = "https://opensource.org/licenses/MIT"
  }
  backend_service = {
    url = "https://backend1.example.com"
  }
  oauth2_authorization = {
    authorization_server_name = "auth-server"
    scope                     = "read"
  }
  openid_authentication = {
    openid_provider_name         = "openid-provider"
    bearer_token_sending_methods = ["authorizationHeader"]
  }
  subscription_key_parameter_names = {
    header = "Ocp-Apim-Subscription-Key"
    query  = "subscription-key"
  }
}


#-----------------------------------------------------------------------
# API-Management - API - Logger
#-----------------------------------------------------------------------

resource "azurerm_application_insights" "appinsights" {
  name                = "example-appinsights"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  application_type    = "other"
}

module "apimlogger_instance" {
  source = "./modules/apimlogger"  # Adjust the source to your module path

  name                          = "logger1"
  api_management_api_names      = ["apim-example"]
  resource_group_name           = "rg-example"
  application_insights_id       = azurerm_application_insights.appinsights.id
  buffered                      = true
  description                   = "Logger for API Management"

  eventhub = {
    name                             = "eventhub-logger"
    connection_string                = "Endpoint=sb://example.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=xxxx"
    endpoint_uri                     = "sb://example.servicebus.windows.net/"
    user_assigned_identity_client_id = "client-id-xxxx"
  }

  application_insights = {
    instrumentation_key = azurerm_application_insights.appinsights.instrumentation_key
    connection_string   = azurerm_application_insights.appinsights.connection_string
  }
} 

#-----------------------------------------------------------------------
# API-Management - API - Diagnostic
#-----------------------------------------------------------------------
