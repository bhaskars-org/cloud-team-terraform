variable "application" {
  description = "Application name"
  type        = string

  validation {
    condition     = length(trimspace(var.application)) > 0
    error_message = "Application name must not be empty."
  }
}


variable "environment" {
  description = "Environment name"
  type        = string

  validation {
    condition = contains(
      ["dev", "qa", "uat", "prod"],
      lower(var.environment)
    )

    error_message = "Environment must be one of: dev, qa, uat, prod."
  }
}


variable "domain_name" {
  description = "Primary domain name for the ACM certificate"
  type        = string

  validation {
    condition     = length(trimspace(var.domain_name)) > 0
    error_message = "Domain name must not be empty."
  }
}


variable "validation_method" {
  description = "ACM certificate validation method"
  type        = string
  default     = "DNS"

  validation {
    condition     = contains(["DNS", "EMAIL"], upper(var.validation_method))
    error_message = "Validation method must be DNS or EMAIL."
  }
}


variable "subject_alternative_names" {
  description = "Optional Subject Alternative Names for the certificate"
  type        = list(string)
  default     = []
}


variable "key_algorithm" {
  description = "Key algorithm for ACM certificate"
  type        = string
  default     = "RSA_2048"

  validation {
    condition = contains(
      [
        "RSA_2048",
        "RSA_3072",
        "RSA_4096",
        "EC_prime256v1",
        "EC_secp384r1",
        "EC_secp521r1"
      ],
      var.key_algorithm
    )

    error_message = "Invalid ACM key algorithm."
  }
}


variable "certificate_transparency_logging_preference" {
  description = "Certificate Transparency logging preference"
  type        = string
  default     = "ENABLED"

  validation {
    condition = contains(
      ["ENABLED", "DISABLED"],
      var.certificate_transparency_logging_preference
    )

    error_message = "Value must be ENABLED or DISABLED."
  }
}


variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
