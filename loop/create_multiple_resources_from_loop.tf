#--------------------------------------------------------------------------------
# Loop through the list variable to create corresponding resources
#--------------------------------------------------------------------------------
variable "length" {
  description = "APIs to enable"
  default = [1, 2, 3, 4, 5]
}

resource "random_string" "random" {
  count            = length(var.length)
  length           = element(var.length, count.index)
  lower            = true
  upper            = false
  special          = false
}

output "random" {
  value = random_string.random[*].result
}