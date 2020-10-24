# Cloud-iQ PowerShell module

PowerShell module for working with Crayon Cloud-iQ, enabling automatic reporting and management of licenses. Currently in alpha, but it is functionable.

The module is published on the [PowerShell Gallery](https://www.powershellgallery.com/packages/cloudiQ), making it easy to install and keep up to date.

## Installation

```powershell
Install-Module -Name CloudiQ -AllowPrerelease
```

## Why a PowerShell module?

The thought is that you should be able to do work with Cloud-iQ in PowerShell, and have all the functions that you have through the portal. The upside is that it is faster to work in CLI, and that you can easily automate tasks with it.

For instance, say that you have a PowerShell script for adding a new user. Giving the user a license is easy when using [group-based licensing](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-licensing-whatis-azure-portal) but you still need to have enough licenses for the number of active users. By using this PowerShell module we could make sure that for every user we create, we add one more license.

[![Pester](https://github.com/CrayonGroup/CloudiQ.PowerShell/workflows/Pester/badge.svg?branch=master)](https://github.com/CrayonGroup/CloudiQ.PowerShell/actions?query=workflow%3APester)
[![codecov](https://codecov.io/gh/CrayonGroup/CloudiQ.PowerShell/branch/master/graph/badge.svg)](https://codecov.io/gh/CrayonGroup/CloudiQ.PowerShell)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/CloudiQ.svg)](https://www.powershellgallery.com/packages/CloudiQ)

[![Cloud-iQ](https://img.shields.io/badge/Learn%20More-Cloud--iQ-orange)](https://www.crayon.com/en/our-services/managed-and-subscription-services/cloud-iq/)
