# Définition du ssm_parameter
# on utilisera le fichier cw_agent_config.json pour configurer l'agent
resource "aws_ssm_parameter" "cw_agent" {
  description = "Cloudwatch agent config to configure custom log"
  name        = "/cloudwatch-agent1/config"
  type        = "String"
  value       = file("cw_agent_config.json") # 
  overwrite   = true
}
