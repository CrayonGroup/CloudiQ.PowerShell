# Changelog

## v1.0.0-alpha5
- Add ItemName to output of Get-CloudiQSubscription (#13)
- Add subscription ID from the Cloud-iQ portal to the subscriptions shown through PowerShell (#14)

### Miscellaneous fixes
- Updated how Get-CloudiQSubscriptionAddon works, slightly
- Fixed tests to work with the changes from #13

---

## v1.0.0-alpha4

### New features
- Added Get-CloudiQSubscriptionAddon (#6)
- Added aliases for current available cmdlets (#8)
- Issues working with SecureString, cross-platform (#9)
- Define scope and visibility for sensitive variables (#10)

### Automation
- GitHub Action, publishing new releases to the PowerShell Gallery (#2)

### Miscellaneous fixes
- Updated docs with new functions

From alpha4, there will be a changelog item. In practice, it makes it easier to write changes as it's implemented and when creating a release you have the text ready to go. Prior to alpha4, keeping a changelog has not been a priority. For more info on the why and how, take a look at [keepachangelog.cm](https://keepachangelog.com/)