# RSA key of size 4096 bits
resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
