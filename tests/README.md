## Tests Directory Overview

This `tests/` directory should be used for validating the policies defined within the Policy as Code (PaC) framework.

### Purpose

This folder is dedicated for performing use-case simulations using Terraform and LocalStack. These tools help to create near-realistic, controlled testing environments where open policies are evaluated against simulated Terraform plans.

### Key Features

- **Simulated Environments**: Near-Realistic environments created using Terraform plans to mimic actual infrastructure configurations.
- **Policy Validation**: Ensures that policies meet their intended objectives and function as expected.
- **Tools Utilized**:
  - **Terraform**: For creating and testing infrastructure-as-code plans.
  - **LocalStack**: For simulating AWS services locally.

### Use Cases

The directory covers various scenarios, such as:

1. Security policy enforcement.
2. Cost optimization checks.
3. Regulatory compliance validation.
4. Operational efficiency testing.
