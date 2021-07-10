# To create ssh keys

## Generate key pairs

```
$ ssh-keygen -t ed25519 -C "your_email@example.com"
```

You can choose another algorithms such as

```
$ ssh-keygen -t rsa -b 4096
$ ssh-keygen -t ecdsa -b 521
```

## To validate key pairs 
After adding your public keys, you validate it for example github

```
$ ssh -T git@github.com
```

### Note
- For Windows user, make sure your ssh-agent is running.
- You can open Windows PowerShell and check it by command below.

```
Get-Service ssh-agent
```

- If it is not running you can set it at Services App

## References
1. https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
2. https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement
