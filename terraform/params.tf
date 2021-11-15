variable "teams" {
  type = list(object({
    full_name    = string
    abbreviation = string
  }))
  default = [
        {
      full_name    = "AUGPProject"
      abbreviation = "augpweb1"
    }
  ]
}
