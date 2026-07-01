# Variable declarations for the provider block example

variable "string_length" {
  description = "The length of the random string to generate"
  type        = number
  default     = 12

  validation {
    condition     = var.string_length > 0 && var.string_length <= 64
    error_message = "String length must be between 1 and 64."
  }
}
