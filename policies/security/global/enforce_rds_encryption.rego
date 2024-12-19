package terraform.security.global.enforce_rds_encryption

############################################################
# Policy: Enforce RDS Encryption
# Description: Checks if RDS instances are encrypted
# Domain: Security
# Scope: Global
# Policy Owner: Security Team
# Policy Contributor: DevOps Team
############################################################

import input as tfplan
import rego.v1

# Define the resource types to check
resource_types := ["aws_db_instance", "aws_rds_cluster", "aws_rds_cluster_instance"]

# Deny if RDS instance is not encrypted
deny contains msg if {
    resource := tfplan.resource_changes[_]
    resource.type in resource_types 
    not resource.change.after.storage_encrypted
    msg := sprintf("RDS instance %s is not encrypted at rest", [resource.name])
}
