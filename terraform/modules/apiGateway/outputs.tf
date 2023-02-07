

output "id" {
  description = "API GW id"

  value = aws_api_gateway_rest_api.api.id
}

output "http_method" {
  description = "API GW http method"

  value = aws_api_gateway_method.method.http_method
}

output "resource_path" {
  description = "Api GW resource path"

  value = aws_api_gateway_resource.resource.path
}