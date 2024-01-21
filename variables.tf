variable "helm_release" {
  description = "Helm release"
  default     = {}
  type = map(object({
    name             = string
    repository       = optional(string)
    chart            = string
    version          = optional(string)
    namespace        = optional(string)
    create_namespace = optional(bool, true)
    lint             = optional(bool, true)
    values           = optional(list(string))
    }
  ))
}
variable "helm_template" {
  description = "Helm template"
  # nullable    = true
  default = {}
  type = map(object({
    name             = optional(string)
    repository       = optional(string)
    chart            = optional(string)
    version          = optional(string)
    namespace        = optional(string)
    create_namespace = optional(bool, true)
    values           = optional(list(string))
    }
  ))
}
