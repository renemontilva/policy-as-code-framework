package terraform.security.global.enforce_rds_encryption_test

############################################################
# Policy: Enforce RDS Encryption
# Description: Unit Test policy that checks if RDS instances are encrypted
# Domain: Security
# Scope: Global
# Policy Owner: Security Team
# Policy Contributor: DevOps Team
############################################################


import rego.v1

import data.terraform.security.global.enforce_rds_encryption.deny

test_not_encrypted_at_rest if {
    result = deny with input as {
        "resource_changes": [
            {
                "name": "test-rds-instance",
                "type": "aws_db_instance",
                "change": {
                    "after": {
                        "storage_encrypted": false
                    }
                }
            },
            {
                "name": "test-rds-cluster",
                "type": "aws_rds_cluster",
                "change": {
                    "after": {
                        "storage_encrypted": false
                    }
                }
            }
        ]
    }
    count(result) == 2
}

test_encrypted_at_rest if {
    result = deny with input as {
        "resource_changes": [
            {
                "name": "test-rds-instance",
                "type": "aws_db_instance",
                "change": {
                    "after": {
                        "storage_encrypted": true
                    }
                }
            },
            {
                "name": "test-rds-cluster",
                "type": "aws_rds_cluster",
                "change": {
                    "after": {
                        "storage_encrypted": true
                    }
                }
            }
        ]
    }

    count(result) == 0
}

