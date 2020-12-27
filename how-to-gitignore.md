# Add gitignore file to any project
this file lists up files or directories to ignore for commit to avoid any unnecessary conflicts

1. go to: [https://gitignore.io](https://gitignore.io)
2. type in keywords like swift, python which are relevent to your project
3. copy the generated file
4. make file named `.gitignore` in your git repository
5. paste copied file into your `.gitignore`
6. push your project

# git once-for-all

## global settings
get yourself identified 
```git
git config user.name
git config user.email
```

configre git to handle line endings
```git
#for mac
git config --globak core.autocrlf input

#for Windows
git config --globak core.autocrlf true
```

## start git
1. mkdir your-project-directory
2. cd your-project-directory
3. initialize git repo
```git
git init
```
4. you can remove git repo
```git
rm -rf .git
```
5. check git status of working directory
```git
git status 
git status -s
```

6. add file to staging area for tracking
```git
git add <file>
```

7. use "git rm --cached <file>..." to unstage
```git
git rm --cached <file>
```
8. configure git not to track specific file or directory
generate .gitignore file
  
9. see changes in files

### Git Workflow
#### LOCAL
1. working directory
  - untracked
  - tracked
    - unmodified
    - modified
2. staging area
3. .git repository (checkout)

#### REMOTE
1. .git repository (pull)
