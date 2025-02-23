#-----------------------------------------------------------------------
# API - Management
#-----------------------------------------------------------------------

variable "apim_instances" {
  description = "The APIM instances to make"
  type = list(object({
    name                      = string
    rg_name                   = string
    location                  = optional(string, "uksouth")
    tags                      = map(string)
    publisher_name            = string
    publisher_email           = string
    sku_name                  = string
    client_cetuficate_enabled = optional(bool)
    gateway_disabled          = optional(bool)
    min_api_version           = optional(string)
    zones                     = optional(list(string))
    identity_ids              = optional(list(string))
    identity_type             = optional(string)
    additional_location = optional(list(object({
      location             = string
      capacity             = optional(string)
      zones                = optional(list(string))
      public_ip_address_id = optional(string)
      virtual_network_configuration = optional(object({
        subnet_id = string
      }))
      gateway_disabled = optional(bool)
    })))
    certificate = optional(list(object({
      encoded_certificate  = string
      store_name           = string
      certificate_password = optional(string)
    })))
    delegation = optional(object({
      subscriptions_enabled     = optional(bool)
      user_registration_enabled = optional(bool)
      url                       = optional(string)
      validation_key            = optional(string)
    }))
    hostname_configuration = optional(object({
      management = optional(list(object({
        host_name                       = string
        key_vault_id                    = optional(string)
        certificate                     = optional(string)
        certificate_password            = optional(string)
        negotiate_client_certificate    = optional(bool)
        ssl_keyvault_identity_client_id = optional(string)
      })))
      portal = optional(list(object({
        host_name                       = string
        key_vault_id                    = optional(string)
        certificate                     = optional(string)
        certificate_password            = optional(string)
        negotiate_client_certificate    = optional(bool)
        ssl_keyvault_identity_client_id = optional(string)
      })))
      developer_portal = optional(list(object({
        host_name                       = string
        key_vault_id                    = optional(string)
        certificate                     = optional(string)
        certificate_password            = optional(string)
        negotiate_client_certificate    = optional(bool)
        ssl_keyvault_identity_client_id = optional(string)
      })))
      proxy = optional(list(object({
        default_ssl_binding             = optional(bool)
        host_name                       = string
        key_vault_id                    = optional(string)
        certificate                     = optional(string)
        certificate_password            = optional(string)
        negotiate_client_certificate    = optional(bool)
        ssl_keyvault_identity_client_id = optional(string)
      })))
      scm = optional(list(object({
        host_name                       = string
        key_vault_id                    = optional(string)
        certificate                     = optional(string)
        certificate_password            = optional(string)
        negotiate_client_certificate    = optional(bool)
        ssl_keyvault_identity_client_id = optional(string)
      })))

    }))
    notification_sender_email = optional(string)
    protocols = optional(object({
      enable_http2 = optional(bool)
    }))
    security = optional(object({
      enable_backend_ssl30                                = optional(bool)
      enable_backend_tls10                                = optional(bool)
      enable_backend_tls11                                = optional(bool)
      enable_frontend_ssl30                               = optional(bool)
      enable_frontend_tls10                               = optional(bool)
      enable_frontend_tls11                               = optional(bool)
      tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = optional(bool)
      tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = optional(bool)
      tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = optional(bool)
      tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = optional(bool)
      tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = optional(bool)
      tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = optional(bool)
      tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = optional(bool)
      tls_rsa_with_aes256_gcm_sha384_ciphers_enabled      = optional(bool)
      tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = optional(bool)
      tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = optional(bool)
      triple_des_ciphers_enabled                          = optional(bool)
    }))
    sign_in = optional(object({
      enabled = bool
    }))
    sign_up = optional(object({
      enabled = bool
      terms_of_service = optional(object({
        enabled          = bool
        consent_required = bool
        text             = optional(string)
      }))
    }))
    tenant_access = optional(object({
      enabled = bool
    }))
    public_ip_address_id          = optional(string)
    public_network_access_enabled = optional(bool, true)
    virtual_network_type          = optional(string)
    virtual_network_configuration = optional(object({
      subnet_id = string
    }))
  }))
}

#-----------------------------------------------------------------------
# API - Management - API
#-----------------------------------------------------------------------

variable "apimapi_instance" {
  description = "List of API Management API instances."
  type = list(object({
    id                              = string
    name                            = format("%", var.name_postfix)
    resource_group_name             = string
    api_management_name             = string
    revision                        = optional(string)
    display_name                    = string
    path                            = string
    protocols                       = list(string)
    api_type                        = optional(string)
    service_url                     = string
    revision_description            = optional(string)
    description                     = optional(string)
    subscription_required           = optional(bool, true)
    terms_of_service_url            = optional(string)
    version                         = optional(string)
    version_description             = optional(string)
    version_set_id                  = optional(string)
    import                          = optional(object({
      content_format = string
      content_value  = string
      wsdl_selector  = optional(object({
        service_name  = string
        endpoint_name = string
      }))
    }))
    subscription_key_parameter_names = optional(object({
      header = string
      query  = string
    }))
    contact = optional(object({
      name  = string
      email = string
      url   = string
    }))
    license = optional(object({
      name = string
      url  = string
    }))
    backend_service = optional(object({
      url = string
    }))
    oauth2_authorization = optional(object({
      authorization_server_name = string
      scope                     = string
    }))
    openid_authentication = optional(object({
      openid_provider_name         = string
      bearer_token_sending_methods = list(string)
    }))
  }))
}

#-----------------------------------------------------------------------
# API-Management - API - Logger
#-----------------------------------------------------------------------

variable "apimlogger_instance" {
  description = "List of API Management Logger instances."
  type = list(object({
    name                          = string
    api_management_api_names      = string
    resource_group_name           = string
    application_insights_id       = string
    buffered                      = optional(bool, true)
    description                   = optional(string)
    eventhub = optional(object({
      name                          = string
      connection_string             = string
      endpoint_uri                  = string
      user_assigned_identity_client_id = string
    }))
    application_insights = optional(object({
      instrumentation_key = string
      connection_string   = string
    }))
  }))
}