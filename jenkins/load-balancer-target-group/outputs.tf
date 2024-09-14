# output "aws_lb_dns_name" {
#   value = aws_lb.dev_proj_1_lb_target_group.dns_name
# }

# output "aws_lb_zone_id" {
#   value = aws_lb.dev_proj_1_lb_target_group.zone_id
# }
output "aws_lb_target_group_arn" {
   value = aws_lb_target_group.dev_proj_1_lb_target_group.arn
 }