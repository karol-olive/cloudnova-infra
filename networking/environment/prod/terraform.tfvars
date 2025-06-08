################################################################## START COMMON ####################################################################
project_name = "cloudnova"
region       = "eu-west-1"
################################################################## END COMMON ####################################################################


################################################################## START NETWORKING #################################################################
vpc_cidr = "10.0.0.0/16"

vpc_additional_cidrs = [
  "100.64.0.0/16"
]

public_subnets = [
  {
    name              = "cn-public-1a"
    cidr              = "10.0.48.0/24"
    availability_zone = "eu-west-1a"
  },
  {
    name              = "cn-public-1b"
    cidr              = "10.0.49.0/24"
    availability_zone = "eu-west-1b"
  },
  {
    name              = "cn-public-1c"
    cidr              = "10.0.50.0/24"
    availability_zone = "eu-west-1c"
  }
]

private_subnets = [
  {
    name              = "cn-private-1a"
    cidr              = "10.0.0.0/20"
    availability_zone = "eu-west-1a"
  },
  {
    name              = "cn-private-1b"
    cidr              = "10.0.16.0/20"
    availability_zone = "eu-west-1b"
  },
  {
    name              = "cn-private-1c"
    cidr              = "10.0.32.0/20"
    availability_zone = "eu-west-1c"
  },
  // Pods Subnets
  {
    name              = "cn-pods-1a"
    cidr              = "100.64.0.0/18"
    availability_zone = "eu-west-1a"
  },
  {
    name              = "cn-pods-1b"
    cidr              = "100.64.64.0/18"
    availability_zone = "eu-west-1b"
  },
  {
    name              = "cn-pods-1c"
    cidr              = "100.64.128.0/18"
    availability_zone = "eu-west-1c"
  }
]

database_subnets = [
  {
    name              = "cn-database-1a"
    cidr              = "10.0.51.0/24"
    availability_zone = "eu-west-1a"
  },
  {
    name              = "cn-database-1b"
    cidr              = "10.0.52.0/24"
    availability_zone = "eu-west-1b"
  },
  {
    name              = "cn-database-1c"
    cidr              = "10.0.53.0/24"
    availability_zone = "eu-west-1c"
  }
]

netacl_rules = [
  {
    rule_number = 200
    rule_action = "allow"
    protocol    = "tcp"
    cidr_block  = "10.0.0.0/20"
    from_port   = 3306
    to_port     = 3306
  }
]

################################################################## END NETWORKING #################################################################
