#-----------------------------------------------------------------------
# API - Management
#-----------------------------------------------------------------------

output "apim_certificate_expiries" {
  description = "The expiration dates of the certificates for all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.certificate[*].expiry]
}

output "apim_certificate_subjects" {
  description = "The subjects of the certificates for all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.certificate[*].subject]
}

output "apim_certificate_thumbprints" {
  description = "The thumbprints of the certificates for all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.certificate[*].thumbprint]
}

output "apim_developer_portal_urls" {
  description = "The Developer Portal URLs of all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.developer_portal_url]
}

output "apim_gateway_regional_urls" {
  description = "The Regional Gateway URLs of all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.gateway_regional_url]
}

output "apim_gateway_urls" {
  description = "The Gateway URLs of all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.gateway_url]
}

output "apim_hostname_configuration_proxy_certificate_sources" {
  description = "The certificate sources for proxy hostname configurations in all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.hostname_configuration[*].proxy[*].certificate_source]
}

output "apim_hostname_configuration_proxy_certificate_statuses" {
  description = "The certificate statuses for proxy hostname configurations in all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.hostname_configuration[*].proxy[*].certificate_status]
}

output "apim_hostname_configurations" {
  description = "The hostname configurations for all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.hostname_configuration]
}

output "apim_identities" {
  description = "The identity blocks for all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.identity]
}

output "apim_ids" {
  description = "The IDs of all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.id]
}

output "apim_management_api_urls" {
  description = "The Management API URLs of all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.management_api_url]
}

output "apim_portal_urls" {
  description = "The Publisher Portal URLs of all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.portal_url]
}

output "apim_private_ip_addresses" {
  description = "The Private IP addresses of all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.private_ip_addresses]
}

output "apim_public_ip_addresses" {
  description = "The Public IP addresses of all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.public_ip_addresses]
}

output "apim_scm_urls" {
  description = "The SCM URLs of all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.scm_url]
}

output "apim_tenant_accesses" {
  description = "The tenant access blocks for all the API Management instances."
  value       = [for apim in azurerm_api_management.apim : apim.tenant_access]
}

#-----------------------------------------------------------------------
# API - Management - API
#-----------------------------------------------------------------------

output "api_management_api_ids" {
  description = "IDs of created API Management APIs."
  value = { for k, v in azurerm_api_management_api.example : k => v.id }
}

output "api_management_api_names" {
  description = "Names of created API Management APIs."
  value = [for api in azurerm_api_management_api.example : api.name]
}

#-----------------------------------------------------------------------
# API-Management - API - Logger
#-----------------------------------------------------------------------

output "api_management_logger_ids" {
  description = "IDs of created API Management Loggers."
  value = { for k, v in azurerm_api_management_logger.example : k => v.id }
}

output "api_management_logger_names" {
  description = "Names of created API Management Loggers."
  value = [for logger in azurerm_api_management_logger.example : logger.name]
}