# Changelog

## v1.0.0

## v1.0.0-alpha7

- Add PublisherSubscriptionId parameter to filter subscription (#21)
- Added default view with few details, and a detailed switch (3ddf072ca38823d0866c46580fd894887fe8e8d4)

## v1.0.0-alpha6

### New Features
- Added `Get-CloudiQAgreement` (#17)

### Miscellaneous fixes
- Added tests for `Connect-CloudiQ`

From now on, the documentation is hosted in the branch gh-pages, which mkdocs automatically push to when using `mkdocs gh-deploy`.

## v1.0.0-alpha5

### New features
- Add ItemName to output of `Get-CloudiQSubscription` (#13)
- Add subscription ID from the Cloud-iQ portal to the subscriptions shown through PowerShell (#14)

### Miscellaneous fixes
- Updated how `Get-CloudiQSubscriptionAddon` works, slightly
- Fixed tests to work with the changes from #13
- Started using mkdocs for the documentation site

---

## v1.0.0-alpha4

### New features
- Added `Get-CloudiQSubscriptionAddon` (#6)
- Added aliases for current available cmdlets (#8)
- Issues working with SecureString, cross-platform (#9)
- Define scope and visibility for sensitive variables (#10)

### Automation
- GitHub Action, publishing new releases to the PowerShell Gallery (#2)

### Miscellaneous fixes
- Updated docs with new functions

From alpha4, there will be a changelog item. In practice, it makes it easier to write changes as it's implemented and when creating a release you have the text ready to go. Prior to alpha4, keeping a changelog has not been a priority. For more info on the why and how, take a look at [keepachangelog.cm](https://keepachangelog.com/)