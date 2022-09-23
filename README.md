<!-- PROJECT LOGO -->
<br />

<div align="center">
 <div>
   <img src="https://blog.stephane-robert.info/img/Terraform-logo-small.png" alt="Logo" width="120" height="120">
   <img src="https://www.theeggbrussels.com/wp-content/uploads/2018/05/logo-AWS-300x192.png" alt="Logo" width="150" height="80">
 </div>


  <h3 align="center">Infrastructure fabriquée avec Terraform pour déployer un EC2 monitoré via le CloudWatch agent de AWS
</h3>
</div>

<!-- ABOUT THE PROJECT -->
## About The Project

Ce projet est inspiré d'un travaux pratique réalisé lors d'un TP sur AWS.
Dans ce TP nous devions créé un EC2 et y ajouter le Cloudwatch Agent afin d'obtenir des metrics.

<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

* Avoir installé AWS cli et être connecté

### Installation

1. Cloner le repo
2. Lancer le projet :
   ```sh
   terraform apply --var-file ../regions/us-east-1/staging/conf.tfvars
   ```
3. Une fois installé pour effacer la config :
   ```sh
   terraform destroy --var-file ../regions/us-east-1/staging/conf.tfvars
   ```
