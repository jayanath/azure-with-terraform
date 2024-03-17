variable "length" {
  type        = number
  description = "length of the random string"
  default     = 8
}

variable "upper" {
  type        = bool
  description = "use upper case or not"
  default     = false
}

variable "special" {
  type        = bool
  description = "use special characters or not"
  default     = false
}