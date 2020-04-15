variable "container_definitions" {
  description = "Container Definitions"
  default = <<DEFINITION
  [
  {
    "name": "project_1",
    "image": "wordpress",
    "essential": true,
    "cpu": 256,
    "memory": 512,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
DEFINITION
}