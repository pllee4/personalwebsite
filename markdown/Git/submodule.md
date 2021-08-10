# Git submodule

## To add submodule

```
$ git submodule add <remote_url> <destination_folder>
```
- please note that you have to give the full path including the name of folder of the submodule for <destination_folder>
- <destination_folder> is equivalent to <any_existing_folder>/<submodule_folder>
- by default without <desination_folder>, the submodule folder would be created on the current directory
  
## To delete submodule

```
$ git submodule deinit <path_to_submodule>
Delete the section referring to the submodule from the .gitmodules file
$ git add .gitmodules (to stage changes)
$ git rm --cached <path_to_submodule> (no trailing slash)
$ rm -rf .git/modules/<path_to_submodule>
$ git commit -m "Removed submodule"
$ rm -rf <path_to_submodule>
``` 

## To update submodule

```
$  git submodule update --init --recursive
```

## References
1. https://forum.freecodecamp.org/t/how-to-remove-a-submodule-in-git/13228
