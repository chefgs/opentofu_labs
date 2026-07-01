variable "prefix_length" {
  description = "Length of the prefix string"
  type        = number
  default     = 6

  validation {
    condition     = var.prefix_length >= 3 && var.prefix_length <= 16
    error_message = "Prefix length must be between 3 and 16."
  }
}
