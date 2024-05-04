# github-k8s-example

## Prerequisites
Before you begin, ensure you have met the following requirements:
- **KUBECONFIG**: You must have `KUBECONFIG` set up in your local environment to interact with your Kubernetes cluster.

## Forking the Repository
To work on this project, please fork this repository to your own GitHub account. This allows you to make changes without affecting the original project.

## Adding Secrets
1. Navigate to your forked repository on GitHub.
2. Go to **Settings** > **Secrets** > **Actions**.
3. Click **New repository secret**.
4. Name the secret `KUBECONFIG`.
5. Enter your Kubeconfig file content in the value field. This will allow GitHub Actions to interact with your Kubernetes cluster.

## Modifying Deployment Files
1. In your forked repository, locate the deployment file usually found in `./deployments/`.
2. Open the deployment file and change the domain to the domain you wish to use for your deployment.

## Contributing
Thank you for your interest in contributing to our project. After making your changes, please create a pull request to the original repository.

## License
Specify the license under which the project is made available.

## Contact
If you have any questions or feedback, please open an issue in the repository.
