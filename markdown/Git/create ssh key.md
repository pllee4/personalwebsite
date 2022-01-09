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

## Adding multiple account

```
$ nano ~/.ssh/config
```
- added information of your account

```
Host github.com
	HostName github.com
	User git
	IdentityFile ~/.ssh/id_rsa_account1

Host github.com-account2
	HostName github.com
	User git
	IdentityFile ~/.ssh/id_rsa_account2
```

- You can test and establish the connection through 
```
$ ssh -T git@github.com-account2
```
- For account1, you can use as normal or as your main account
- For account2, remember to replace "github.com" with "github.com-account2", for example
```
$ git clone git@github.com-account2:<your_username>/<your_repo>.git
``` 

## References
1. https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
2. https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement
