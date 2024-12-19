# Policy as Code Framework

This repository provides a centralized platform for managing Policy as Code (PaC) to enforce security, compliance, and operational excellence across our cloud infrastructure. Policies are designed to be scoped by environment and application need.

## Design Principles

This repository is structured around the AWS Well-Architected Framework pillars, promoting maintainability, scalability, and efficient policy management. This framework ensures policies address critical aspects of:

*   **Security:** Protecting information and systems.
*   **Reliability:** Ensuring consistent and dependable performance.
*   **Performance Efficiency:** Using computing resources efficiently.
*   **Cost Optimization:** Avoiding unnecessary costs.
*   **Operational Excellence:** Running and monitoring systems effectively.

## Repository Structure

The repository is organized as follows:

### `policies/`

This directory contains the core policy definitions, designed to be technology-agnostic where possible. Policies here represent the organization's baseline standards.

### `environments/`

This directory allows for environment-specific overrides to the core policies. For example, stricter security policies might be applied in production compared to development.

### `applications/`

This directory enables granular control by defining application-specific policy overrides. This allows for tailored policies based on the specific requirements of each application.

### `templates/`

This directory stores reusable policy templates, promoting consistency and accelerating policy creation. Templates can be parameterized to adapt to different contexts.

### `tests/`

This directory contains unit and integration tests to verify policy functionality and ensure they behave as expected. This includes tests against mock infrastructure and potentially integration tests against real environments (where appropriate).

### `docs/`

This directory provides comprehensive documentation, including:

*   **Repository-level documentation (`README.md`):** Overview of the repository, its purpose, and how to use it.
*   **Individual policy documentation:** Detailed information about each policy, including its purpose, scope, enforcement mechanisms, parameters, and any relevant background information.

## Local Development Setup

This setup allows you to locally test and validate policies before deploying them. We recommend using a containerized approach for consistency.

1.  **Install Docker:** [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)
2.  **Install Docker Compose:** [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/) (Often included with Docker Desktop)
3.  **Install Python 3 and terraform-local:**

    ```bash
      python3 -m venv .venv
      source .venv/bin/activate
      pip install terraform-local
    ```
4. **Install OPA:**

    ```bash
    brew install opa
    ```

5.  **Policy Testing:**

    This setup utilizes LocalStack and ```terraform-local``` to simulate a cloud environment for testing policies against your Terraform configurations.
    A simplified example workflow:

    * LocalStack: Start LocalStack using Docker Compose:

        ```bash
        docker-compose up
        ``` 
    * Terraform Configuration: Create Terraform configurations representing the infrastructure you want to test. 
    * Terraform Apply: Use ```terraform-local``` to apply the Terraform configuration:

        ```bash
        tflocal init
        tflocal plan -out=tfplan
        tflocal show -json tfplan > tfplan.json
        ```
    * Policy Testing: Use the policy enforcement tool to test policies against the Terraform plan:

        ```bash
         opa exec tfplan.json --decision terraform/security/global --bundle policies/security/global/
        ```

## CI/CD Integration


