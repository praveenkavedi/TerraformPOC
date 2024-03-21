variable "https_port" {
  default = 443
}

variable "elbnames" {
  type = string
}

variable "elbregion" {
  type = list(any)
}

variable "timeout" {
  type = number
}

variable "iamusers" {
  type = list(any)
}
