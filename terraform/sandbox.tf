# resource "azurerm_resource_group" "sandbox" {
#   count    = length(var.teams)
#   name     = "rg-${var.teams[count.index].abbreviation}-dev"
#   location = "West Europe"
# }

# resource "azuread_group" "teams" {
#   count            = length(var.teams)
#   display_name     = "tg-${var.teams[count.index].abbreviation}"
#   mail_enabled     = "false"
#   security_enabled = "true"
# }

# resource "azurerm_role_assignment" "sandbox_contributor" {
#   count                = length(var.teams)
#   scope                = azurerm_resource_group.sandbox[count.index].id
#   principal_id         = azuread_group.teams[count.index].object_id
#   role_definition_name = "Contributor"
# }

# resource "azuredevops_project" "project" {
#   count       = length(var.teams)
#   name        = var.teams[count.index].abbreviation
#   description = "${var.teams[count.index].full_name} team project. Project members are indirectly managed by HR system"
# }

# data "azuread_application_template" "example" {
#   display_name = "Marketo"
# }

# resource "azuread_application" "appreg" {
#   count        = length(var.teams)
#   display_name = "app-${var.teams[count.index].abbreviation}"
#   owners       = []
#   template_id = data.azuread_application_template.example.template_id
# }

# resource "azuread_application_password" "example" {
#   count        = length(var.teams)
#   application_object_id = azuread_application.appreg[count.index].object_id
#   # azuread_application.appreg[count.index].application_id
# }

# # resource "azuread_application" "appreg" {
# #   count                      = length(var.teams)
# #   display_name               = "app-${var.teams[count.index].abbreviation}"
# # }

# # resource "azuread_service_principal" "sp" {
# #   count          = length(var.teams)
# #   application_id = azuread_application.appreg[count.index].application_id
# # }

# # resource "random_password" "sp_pass_value" {
# #   count   = length(var.teams)
# #   length  = 17
# #   special = true
# # }

# # resource "azuread_service_principal_password" "sp_password" {
# #   count                = length(var.teams)
# #   service_principal_id = azuread_service_principal.sp[count.index].id
# #   value                = random_password.sp_pass_value[count.index].result
# #   end_date             = "2099-01-01T01:02:03Z"
# # }

# # resource "azuredevops_serviceendpoint_azurerm" "sc_sandbox" {
# #   count       = length(var.teams)
# #   project_id            = azuredevops_project.project[count.index].id
# #   service_endpoint_name = "sc-sandbox"
# #   credentials {
# #     serviceprincipalid  = azuread_service_principal.sp[count.index].id
# #     serviceprincipalkey = random_password.sp_pass_value[count.index].result
# #   }
# #   azurerm_spn_tenantid      = var.tenant_id
# #   azurerm_subscription_id   = var.sandbox_sub_id
# #   azurerm_subscription_name = "sub-sandbox-1"
# #   resource_group    =  "rg-${var.teams[count.index].abbreviation}-we-san-01"
# # }

# data "azuredevops_group" "contributor" {
#   count      = length(var.teams)
#   project_id = azuredevops_project.project[count.index].id
#   name       = "Contributors"
# }

# resource "azuredevops_group" "contributor" {
#   count      = length(var.teams)
#   origin_id    = azuread_group.teams[count.index].id
# }

# resource "azuredevops_group_membership" "contr" {
#   count      = length(var.teams)
#   group = data.azuredevops_group.contributor[count.index].descriptor
#   members = [
#     azuredevops_group.contributor[count.index].descriptor
#   ]
# }

