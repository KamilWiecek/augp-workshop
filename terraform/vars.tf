variable "personal_access_token" {
  type    = string
  default = ""
}

variable "org_service_url" {
  type    = string
  default = "https://dev.azure.com/XXX"
}

variable "spn_object_id" {
  type    = string
  default = "" 
}

variable "spn_secret" {
  type    = string
  default = ""
}

variable "tenant_id" {
  type = string
  default = ""
}

variable "sandbox_sub_id" {
  type = string
  default = "aad861cc-eb75-42fd-9f9e-29f1aa3e1465"
}
