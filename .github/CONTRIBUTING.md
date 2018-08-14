# Contribution Guidelines

## Table of Contents

- [Contribution Guidelines](#contribution-guidelines)
- [Introduction](#introduction)
- [Maintainers](#maintainers)
- [Bug reports](#bug-reports)
- [Add functionalities or bug corrections](#add-functionnalities-or-bug-correction)
- [Sign your work](#sign-your-work)
- [Versioning](#versionning)

## Introduction

This document explains how to contribute to the [SillyWhale](https://www.sillywhale.wtf) project.  
This is a production ready project, assuming this, all changes will not accepted if cause code or functionality regression.

## Maintainers

Maintenance of [SillyWhale](https://www.sillywhale.wtf) projects are done by only four persons.

Please be indulgent according to time to issue answer or resolution.  
We not only work to this project. We do this for many of you on our free time and we can't accord all of it for the project.

## Bug reports

Please, ensure you've already search into issue tracker than your issue not already exist or will be solved.  
If unique, open an issue on specific repository in [SillyWhale organization](https://github.com/SillyWhale/) and answer the questions so we can understand and reproduce the problematic behavior.

Please, on issue creation, **write clear and concise**. Specify all configurations or command you've launch to could be reproduce error in all time you send.

Please be kind, remember that [SillyWhale](https://www.sillywhale.wtf) is communal development.

## Add functionalities or bug correction

To actively contribute to this project, you could generate pull request to include your modifications if you think this is needed to merged into standard project.  
We work with pull request to integrate new functionalities. This permit us to review proposed change, discuss on it, check it, modify it, and validate or not the change.

Some conditions to create pull request :

1. You'll don't break existing code.
2. You'll don't cause ANY regression (speed or functionalities).
3. On released version, only security correctives could be merged. No functionalities adds.
4. You'll only pass by repository fork and pull request to add something.

How to contribute :

1. Fork master branch
2. Update project into your fork
3. Create pull request

## Sign your work

When you add or modify code, please, just sign your commit with your real name.  
To do this, just add to end of your commit the next line  

```txt
Signed-off-by: John DOE <john.doe@domain.tld>
```

Or if you've GPG key, directly sign your commit with it by a simple `git commit -S`

## Versioning

To generate new releases of project, we work on not finished code into specific branch sur as `release/v1.0`.  
This method permit to not break master branch with new code, and to follow much easier new changes.

When new release is finished to write, we merge it onto master branch, we create new tag `1.0` and drop branch.