resource "aws_acm_certificate" "this" {
  domain_name       = var.domain_name
  validation_method = var.validation_method

  subject_alternative_names = var.subject_alternative_names

  key_algorithm = var.key_algorithm

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference
  }

  tags = merge(
    var.tags,
    {
      Name        = "${var.application}-${var.environment}-ssl"
      Application = var.application
      Environment = var.environment
      Service     = "SSL"
      ManagedBy   = "Terraform"
      Team        = "Cloud-Team"
    }
  )
}
