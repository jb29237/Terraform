variable "access_key" {} 
variable "secret_key" {}

variable "region" {
  default = "us-east-1"
}
variable "ami" {
  default = "ami-9887c6e7"
}
variable "size" {
  default = "t2.micro"
}
variable "myip" {
  type = "list"
  default = ["192.168.1.1"]
}
variable "pub_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPKVR4kSCqbDY1H1GzMw4v+fSYzq5lHAoMo9VWCLZaYkhw25AyuB/0WRMAkfGBPziTwfMhTM5Zv170u3Q+rq4+zJ7e3oxSEkENcU+9Y25cPKBttT5WSFwpUpBT1SKeT2smwUKqZOuz1A+G2aAKqmNo2QboXv1NCd0d/uMVG4doJAJFYBjL9pFnuDS9msE7+kzDPIe0PBgnoInnz528E+JKqwwJGCUUvmjGGXO/dYTXTI9JC+p7U1yd3ilVCzXOMZ4ji3HnYqTVH9hM7D2i+X52O/zGOgzsAgrRj7TW1FQBaLWZ+JQxeHLiynyiRXey4bT6G98v6Hi0s0hWSA5QP/kp"
}
