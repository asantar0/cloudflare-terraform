variable "zone_id" {
  value     = ${{ secrets.ZONE_ID }}
  type      = string
  sensitive = true
}

variable "domain" {
  value     = ${{ secrets.DOMAIN }}
  type      = string
  sensitive = true
}

variable "api_token" {
  value     = ${{ secrets.API_TOKEN }}
  type      = string
  sensitive = true
}
