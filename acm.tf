resource "aws_acm_certificate" "main" {
  domain_name = "${var.application}.${lookup(var.env_dns_zones_prefix, terraform.workspace)}${var.domain}"

  validation_method = "DNS"

  tags {
    Name        = "${var.application}.${lookup(var.env_dns_zones_prefix, terraform.workspace)}${var.domain}"
    Workspace   = "${terraform.workspace}"
    Environment = "${lookup(var.env_names, terraform.workspace)}"
    App         = "${var.application}"
    terraformed = "true"
  }
}

resource "aws_acm_certificate_validation" "main" {
  certificate_arn = "${aws_acm_certificate.main.arn}"

  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
}
