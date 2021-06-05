# awsrole

Script to switch roles between AWS accounts easily

## Usage

```
$ awsrole
Usage: ./awsrole.sh <role_arn> [<mfa_code> <source_profile>]
```

Example:

```
$ awsrole arn:aws:iam::<account>:<role name>
Enter MFA code for arn:aws:iam::<iamaccount>:mfa/awsusername<e.g chinonso.okeke>:
116509
```

## Installation

Clone this project

```
git clone git@github.com:cokekep/awsrole-switch.git
```

Install the script

```
cd awsrole
make install
```

## Recommended Aliases

You can add these to your `.zshrc` / `.bashrc` / `.profile`

```
alias <accountname e.g awsdev>="source arn:aws:iam::<accountID>:role/role name"
alias <accountname e.g awsstag>="source arn:aws:iam::<accountID>:role/role name"
alias <accountname e.g awsprod>="source arn:aws:iam::<accountID>:role/role name"
```
