# ADT-end-to-end

## Introduction

This hack is inspired by an existing [tutorial](https://learn.microsoft.com/en-us/azure/digital-twins/tutorial-end-to-end), updated to use the latest version of .NET Cor and Visual Studio Code as Development Environment. It explains how to build out an end-to-end solution that demonstrates the functionality of the Azure Digital Twins service.

## Prerequisites

This hack uses the command line, both for setup and project work. This makes Visual Studio Code an ideal environment to work in.

What you need to begin:

- Visual Studio Code
- C# VS Code extension
- Azure Function VS Code extension
- .NET Core 6.x on your development machine. You can download the latest version for multiple platforms from this download location
- Powershell 7.x or Windows PowerShell 5.x
- 
## Prepare an Azure Digital Twins instance

> NOTE: If you already have an Azure Digital Twins instance in your subscription, you can reuse it for this hack and skip this section.

To work with Azure Digital Twins you'll need an Azure Digital Twins instance and you need the required permissions for using it. You can follow [these instructions](https://learn.microsoft.com/en-us/azure/digital-twins/how-to-set-up-instance-portal) to do so in the Azure portal. If you rather use the CLI, you can follow [these instructions](https://learn.microsoft.com/en-us/azure/digital-twins/how-to-set-up-instance-cli). Make sure you have an AAD user defined that you can assign to the **Azure Digital Twins Data Owner** role.

## Lab Setup

To make sure to limit typos, we create and initialize some variables that can be used in subsequent scripts. The scripts being used are stored in the **scripts** folder of this repository as simple txt files, but they are supposed to be executed in Powershell and have been tested on Powershell 7.x.

The first script (init-vars.ps1) is used to create a resource group with a unique name, in which an Azure Digital Twin service instance is deployed.