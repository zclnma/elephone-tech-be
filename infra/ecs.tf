resource "aws_ecs_task_definition" "elephone_task_definition" {
  container_definitions = file("./taskDef/task-definition.json")
  family = "test"
  cpu = var.container_cpu
  memory = var.container_memory
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = "arn:aws:iam::606850829238:role/AdminEcsTaskRole"
  task_role_arn = "arn:aws:iam::606850829238:role/AdminEcsTaskRole"

  tags = {
    name = "dev_task"
  }
}

resource "aws_ecs_cluster" "elephone_cluster" {
  name = "elephone-test"
  capacity_providers = ["FARGATE"]
  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
  }
}

resource "aws_ecs_service" "elephone_service" {
  name = "elephone-test"
  cluster = aws_ecs_cluster.elephone_cluster.id
  launch_type = "FARGATE"
  task_definition = aws_ecs_task_definition.elephone_task_definition.arn
  desired_count = 2

  network_configuration {
    subnets = []
  }

  load_balancer {
    elb_name = "elephone_test"
    container_name = "t"
    container_port = 8080
    target_group_arn = ""
  }
}