package terraform.<domain>.<scope>.<policy_name>

#######################################################
# Policy: <Policy Name>
# Description: <Description>
# Domain: <Domain>
# Scope: <Scope>
# Policy Owner: <Policy Owner>
# Policy Contributor: <Policy Contributor>
#######################################################

import input as tfplan
import rego.v1

# Policy logic goes here
deny contains msg if {
    resource := tfplan.resource_changes[_]
    #  rule logic goes here
    msg := sprintf("Example policy %s", [resource.name])
}
