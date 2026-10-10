# Terraform Projects 🚀

A collection of hands-on cloud infrastructure projects built with **Terraform** and **Amazon Web Services (AWS)**. This repository documents my journey learning Infrastructure as Code (IaC), cloud automation, and AWS infrastructure management through practical projects.

## 👨‍💻 About Me

Hi, I'm **Sudip Paramanik**, a Computer Science and Engineering student exploring AWS Cloud Engineering, serverless architecture, and Infrastructure as Code.

I'm building practical projects to strengthen my skills in cloud infrastructure provisioning, automation, security, and monitoring.

- GitHub: [@sudipparamanik](https://github.com/sudipparamanik)
- LinkedIn: [Sudip Paramanik](https://www.linkedin.com/in/sudip-paramanik-1985b0420/)

## 🛠️ Tech Stack

<p>
  <img src="https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform"/>
  <img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonwebservices&logoColor=white" alt="AWS"/>
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git"/>
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
</p>

## 📂 Projects

### 1. AWS Cost Anomaly Detector

An automated AWS cost monitoring project provisioned with Terraform. It checks daily AWS spending and can send email alerts when costs exceed a configurable threshold.

**Technologies:** Terraform, AWS Lambda, Python, Amazon EventBridge, AWS Cost Explorer, Amazon SNS, AWS IAM, and Amazon CloudWatch.

**Key features**
- Infrastructure provisioning using Terraform.
- Scheduled cost analysis with EventBridge.
- Serverless cost-checking logic using Lambda.
- Configurable spending thresholds.
- Email notifications using SNS.
- Execution monitoring through CloudWatch Logs.

**Project status:** Initial deployment and Lambda testing completed; further end-to-end alert verification and improvements are ongoing.

🔗 **[View AWS Cost Anomaly Detector](./aws-cost-anomaly-detector/)**

## 🎯 Learning Goals

- Build reusable and maintainable Terraform configurations.
- Provision AWS resources using Infrastructure as Code.
- Understand IAM roles, policies, and least-privilege access.
- Automate cloud operations using serverless services.
- Monitor infrastructure and manage cloud costs.
- Practice Terraform validation, planning, deployment, and cleanup.
- Develop projects that demonstrate practical cloud engineering skills.

## 🚀 Getting Started

To explore a project:

1. Clone this repository:

   ```bash
   git clone https://github.com/sudipparamanik/Terraform-Projects.git
   ```

2. Navigate to the project directory:

   ```bash
   cd Terraform-Projects/aws-cost-anomaly-detector
   ```

3. Follow the project's README for prerequisites, configuration, deployment, testing, and cleanup instructions.

## 🔐 Security and Cost Awareness

- Never commit AWS access keys, credentials, secrets, or sensitive Terraform state files.
- Review Terraform plans before applying changes.
- Use least-privilege IAM permissions.
- Check AWS service pricing before deploying resources.
- Destroy test infrastructure when it is no longer needed.

## 📈 Repository Progress

This repository will grow as I build more projects and deepen my knowledge of Terraform and AWS cloud engineering.

⭐ If you find these projects useful, feel free to explore the repository and share feedback.

---

**Built with curiosity, consistency, and a passion for cloud engineering.**
