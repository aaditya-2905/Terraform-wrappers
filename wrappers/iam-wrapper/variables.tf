variable "roles" {
  description = "Map of IAM role configurations"
  type = map(object({
    name               = string
    assume_role_policy = string
    policy_arns        = optional(list(string))
    inline_policies    = optional(map(string))
    max_session_duration = optional(number)
    description        = optional(string)
    tags               = optional(map(string))
  }))
  default = {}
}
