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

To work with Azure Digital Twins you'll need an Azure Digital Twins instance and you need the required permissions for using it. You can follow [these instructions](https://learn.microsoft.com/en-us/azure/digital-twins/how-to-set-up-instance-portal) to do so in the Azure portal. If you rather use the CLI, you can follow [these instructions](https://learn.microsoft.com/en-us/azure/digital-twins/how-to-set-up-instance-cli). Make sure you have an AAD user defined that you can assign to the **Azure Digital Twins Data Owner** role. If you don't have a valid user (for instance because you are using a Microsoft account instead of a work account) and if you have permission on your account to create new users, create a new internal user using AAD (e.g. name@nameoutlook.onmicrosoft.com). If you want to get started fast with creating an Azure Digital Twins instance, there is a script available as described in the next section.

## Lab Setup

To make sure to limit typos, we create and initialize some variables that can be used in subsequent scripts. The scripts being used are stored in the **scripts** folder of this repository as simple txt files, but they are supposed to be executed in Powershell and have been tested on Powershell 7.x.

The first script (*init-vars.ps1*) is used to create a resource group with a unique name, in which an Azure Digital Twin service instance is deployed. The script will also store all relevant variables in a text file for later reference. The text file can be found in the **users\username\desktop** folder under the name **variables-adthol<random-number>.txt**.

## ADT Modeling

An ADT model is a specific json file with a number of mandatory items. In this hack, we will be simulating a factory. The factory needs a rather complex ADT model. You can find the different models in the models folder of this repository. You can use the script *setup-adt-models.ps1* to upload the needed models, to create ADT instances and to build relationships between the different Twins.