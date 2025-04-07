# Add a record to the domain
resource "cloudflare_dns_record" "www" {
  zone_id = var.zone_id
  comment = "Domain verification record"
  content = "190.190.190.180"
  name    = "www"
  proxied = true
  ttl     = 1
  type    = "A"

  #ipv4_only and ipv6_only with "true" value are avaiable for special zones
  settings = {
    ipv4_only = false
    ipv6_only = false
  }

  #Tags are only available for paid accounts
  #tags = ["owner:SRE-team"]
}
