# Uploading This Repository to GitHub with Git on Windows

This guide is useful when GitHub web upload skips hidden files such as `.github`, `.gitignore`, or `.env.example`.

## 1) Install Git

Double-click this file inside the repository folder:

```text
INSTALL_GIT_WINDOWS.bat
```

If Git is already installed, the script prints the installed version. If Git is missing, it tries to install Git for Windows with `winget`.

Manual install command:

```powershell
winget install --id Git.Git -e --source winget
```

## 2) Create an empty GitHub repository

Recommended repository name:

```text
xui-one-admin-api-examples
```

Important: when creating the GitHub repository, do not select these options:

- Add a README file
- Add .gitignore
- Choose a license

These files already exist in this repository.

## 3) Upload the repository

Double-click:

```text
UPLOAD_TO_GITHUB_WINDOWS.bat
```

The script asks for your GitHub repository URL.

Example:

```text
https://github.com/YOUR_USERNAME/xui-one-admin-api-examples.git
```

Then it runs the equivalent of:

```bash
git init
git branch -M main
git add -A
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/xui-one-admin-api-examples.git
git push -u origin main
```

## 4) If GitHub login appears

Git for Windows usually opens a browser login window through Git Credential Manager. Sign in with your GitHub account and approve the request.

If the command line asks for a password, use a GitHub Personal Access Token instead of your GitHub account password.

## 5) Updating later

After editing files, run `UPLOAD_TO_GITHUB_WINDOWS.bat` again. The script commits and pushes new changes.

Manual commands:

```bash
git add -A
git commit -m "Update docs"
git push
```

## Common errors

### `src refspec main does not match any`

There is no commit yet. Run:

```bash
git add -A
git commit -m "Initial commit"
git branch -M main
git push -u origin main
```

### `remote origin already exists`

The remote was already added. The helper script updates it automatically. Manual command:

```bash
git remote set-url origin https://github.com/YOUR_USERNAME/xui-one-admin-api-examples.git
```

### Authentication failed

Sign in through Git Credential Manager or use a Personal Access Token.
