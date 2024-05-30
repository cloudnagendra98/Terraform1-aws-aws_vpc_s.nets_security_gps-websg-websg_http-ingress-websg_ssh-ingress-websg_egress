variable "vpc_network_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "This is vpc network cidr range"
}

# variable "subnets_cidr_range" {
#   type        = string
#   default     = "10.10.%g.0/24"
#   description = "These are cidr network ranges"

# }

variable "subnets_names" {
  type        = list(string)
  default     = ["web1", "web2", "app1", "app2", "db1", "db2"]
  description = "These are subnets names"

}