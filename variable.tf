variable "server_port" {
description     =   "The port the server will use for HTTP requests"
type            =   number
default         =   8080
    
}

variable "number_example" {
  description   =   "An example of a number variable in Terraformn"
  type          =   number
  default       =   42
}

variable "list_example" {
  description   =   "An example of a list variable in Terraformn"
  type          =   list
  default       =   ["a", "b", "c"]
}

variable "list_numeric_example" {
  description   =   "An example of a numeric list in Terraformn"
  type          =   list(number)
  default       =   [1,2,3]
}

variable "map_example" {
  description    =  "an example of a map in terraform"
  type           =  map(string)
  default   =   {
      key1  =   "value1"
      key2  =   "value2"
      key3  =   "value3"
  }
}

variable "object_example" {
  description   =   "An examplew of a structural type in Terraformn"
  type  = object({
      name  =   string
      age   =   number
      tags  =   list(string)
      enabled   =   bool
  })
  default   = {
      name  =   "value1"
      age   =   42
      tags  =   ["a","b","c"]
      enabled = true
  }
}

variable "security_group_name"  {
    description     =   "The name of the security group"
    type            =   string
    default         =   "terraform-example-instance"
}



