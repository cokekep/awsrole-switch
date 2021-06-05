# awsrole

Script to switch roles between AWS accounts easily

## Usage

```
$ awsrole
Usage: ./awsrole.sh <role_arn> [<mfa_code> <source_profile>]
```

Example:

```
$ awsrole arn:aws:iam::912468240823:role/ep_plyg_access_admin
Enter MFA code for arn:aws:iam::759342711863:mfa/viljami.kuosmanen:
116509
```

## Installation

Clone this project

```
git clone git@gitlab.com:e-pilot/platform/awsrole.git
```

Install the script

```
cd awsrole
make install
```

## Recommended Aliases

You can add these to your `.zshrc` / `.bashrc` / `.profile`

```
alias awssandbox="source arn:aws:iam::851585377472:role/ep_sand_access_dev"
alias awsdev="source awsrole arn:aws:iam::912468240823:role/ep_plyg_access_dev"
alias awsstaging="source awsrole arn:aws:iam::882235782134:role/ep_stag_access_dev"
alias awsprod="source awsrole arn:aws:iam::893804459037:role/ep_prod_access_dev"
```
