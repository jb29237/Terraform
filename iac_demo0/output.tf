output "public_ip" {
  value = "${aws_instance.iac_begin.public_ip}"
}
output "public_dns" {
  value = "${aws_instance.iac_begin.public_dns}"
}