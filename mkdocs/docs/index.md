# Cloud-iQ PowerShell module

This documentation describes how to install and use the PowerShell module for [Cloud-iQ](https://www.crayon.com/en/our-services/managed-and-subscription-services/cloud-iq/), the self-service e-procurement portal from [Crayon](https://crayon.com). With this module you can buy, upgrade and modify the number of licenses you have, and create automation workflows that can help you keep costs down and gain efficiency.

## Why a PowerShell module?

The thought is that you should be able to do work with Cloud-iQ in PowerShell, and have all the functions that you have through the portal. The upside is that it is faster to work in CLI, and that you can easily automate tasks with it.

For instance, say that you have a PowerShell script for adding a new user. Giving the user a license is easy when using [group-based licensing](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-licensing-whatis-azure-portal) but you still need to have enough licenses for the number of active users. By using this PowerShell module we could make sure that for every user we create, we add one more license.