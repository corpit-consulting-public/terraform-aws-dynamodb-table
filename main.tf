resource "aws_dynamodb_table" "dynamodb-table-1" {
  count          = "${var.has_global_secondary_index ? 0 : 1}"
  name           = "${var.name}"
  billing_mode   = "${var.billing_mode}"
  read_capacity  = "${var.read_capacity}"
  write_capacity = "${var.write_capacity}"
  hash_key       = "${var.hash_key}"
  range_key      = "${var.range_key}"
  attribute      = "${var.attribute}"
} 

resource "aws_dynamodb_table" "dynamodb-table-2" {
  count          = "${var.has_global_secondary_index ? 1 : 0}"
  name           = "${var.name}"
  billing_mode   = "${var.billing_mode}"
  read_capacity  = "${var.read_capacity}"
  write_capacity = "${var.write_capacity}"
  hash_key       = "${var.hash_key}"
  range_key      = "${var.range_key}"
  attribute      = "${var.attribute}"
  global_secondary_index {
    name               = "${var.global_index_name}"
    hash_key           = "${var.global_index_hash_key}"
    range_key          = "${var.global_index_range_key}"
    write_capacity     = "${var.global_index_write_capacity}"
    read_capacity      = "${var.global_index_read_capacity}"
    projection_type    = "${var.global_index_projection_type}"
    non_key_attributes = "${var.global_index_non_key_attributes}"
  }
  tags = "${var.tags}"
}

# Notes: attribute can be lists#

# attribute = [{
   # name = "UserId"
   # type = "S"
 # }, {
  #  name = "GameTitle"
   # type = "S"
 # }, {
   # name = "TopScore"
   # type = "N"
 # }]
