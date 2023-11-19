---
title: git命令大全
date: 2023-11-19 20:57:16
tags:
  - Git
categories: 
  - Git
summary: git 常用操作
---
# Git指南
## `git checkout`  切换分支
是的，`git checkout` 命令可以用于切换到不同的提交。您可以使用该命令来查看历史记录中的旧版本，或者在不同的分支和标签之间切换。

要切换到特定的提交，您可以使用以下命令：

```
git checkout <commit>
```

这会将您的工作目录和索引设置为提交 `<commit>` 所表示的状态。请注意，这将会使您处于“分离 HEAD”状态，因此您不能直接对该提交进行修改。如果您想要在此基础上进行修改并提交更改，您需要创建一个新的分支。

如果您想要返回到当前分支的最新提交，您可以使用以下命令：

```
git checkout <branch>
```

这会将您的工作目录和索引设置为分支 `<branch>` 的最新提交。

如果您想要在不同的分支之间切换，您可以使用以下命令：

```
git checkout <branch>
```

这会将您的工作目录和索引设置为分支 `<branch>` 的最新提交，并且将您的 HEAD 指针移动到该分支。

请注意，`git checkout` 命令可能会更改您的工作目录和索引，因此请确保您已经保存了任何未提交的更改，并且在执行此类操作之前备份您的项目。

## 移除已经`tracked`的文件
根据您提供的信息，您已经添加了.gitignore文件来忽略node_modules和unpackage目录。然而，您发现即使在这些目录下的文件内容发生更改后，Git仍然会检测到并提交这些更改。

这可能是因为这些文件已经被Git跟踪并包含在先前的提交中。一旦Git开始跟踪某个文件，即使将其添加到.gitignore文件中，Git仍然会继续跟踪该文件的更改。

为了解决这个问题，您需要告诉Git停止跟踪这些文件。您可以使用以下命令将这些文件从Git中移除：

```
git rm -r --cached node_modules/
git rm -r --cached unpackage/
```

执行这些命令后，Git将停止跟踪这些文件的更改，并且它们将不再出现在未来的提交中。请确保在执行这些命令之前备份任何重要的文件。

完成此操作后，您的.gitignore文件应该能够正确地忽略这些文件夹及其内容的更改。

## 首次关联远端分支
`git push -u <仓库名字> <仓库分支,没有就会新创建一个>`

## 查询远端仓库信息
要查询远程仓库中有哪些分支，可以使用以下命令：

```
git ls-remote --heads <repository-url>|或者是已经关联的远端仓库的名字
```

请将`<repository-url>`替换为远程仓库的URL。执行此命令后，Git会输出远程仓库中所有分支的引用，类似于以下示例：

```
b3e5b1c2e9e8a937b7c1faa9e8c8dbb6d8acab13        refs/heads/branch1
2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1        refs/heads/branch2
a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0        refs/heads/branch3
```

其中每一行都包含一个提交的哈希值（SHA-1），后面紧跟着分支的完整引用名称（包括`refs/heads/`前缀）和分支的名称。这个命令可以帮助您了解远程仓库中所有的分支，以便您可以进行相应的操作，例如克隆特定的分支或推送本地分支到远程仓库。

## git配置本地用户名和邮箱
1. 查询用户名和email
`git config user.email`和`git config user.name`
2. 配置用户名和email
```zsh
git config --global user.name "Acaibird"
git config --global user.email "13234966+a-caibird@user.noreply.gitee.com"
```


##  克隆特定的分支

```zsh
git clone -b <branch-name> --single-branch <repository-url>  
```

请将`<branch-name>`替换为您想要克隆的分支名称，将`<repository-url>`替换为远程仓库的URL。例如，要克隆名为`develop`的分支，可以执行以下命令：

```zsh
git clone -b develop --single-branch <repository-url>
```

这将只克隆指定的分支，并且只会拉取该分支的历史记录，从而节省时间和带宽。如果您不使用`--single-branch`选项，则默认情况下将克隆所有分支。

##  克隆到指定本地目录
是的，可以在 `git clone` 命令后面加上一个目录名称参数，来指定将仓库克隆到的本地目录名称。具体操作方式如下：

```zsh
git clone <repository> <directory>
```

其中，`<repository>` 是要克隆的仓库 URL， `<directory>` 是要将仓库克隆到的本地目录名称。例如，要将名为 `my-project` 的仓库克隆到本地的 `my-local-project` 目录下，可以使用以下命令：

```zsh
git clone https://github.com/username/my-project.git my-local-project
```

这样就会将 `my-project` 仓库中的文件克隆到本地的 `my-local-project` 目录下。

## 合并远端分支到本地分支
如果您的远程仓库有最新的提交，但执行 `git fetch` 后没有更新到本地仓库，可能有几个可能的原因：


如果您确认远程仓库的配置正确，并且最新的提交确实存在于当前分支的关联远程分支上，您可以尝试使用以下命令将远程分支的更新合并到本地分支：

```zsh
git merge origin/branch-name
```

其中，`origin/branch-name` 是包含最新提交的远程分支的名称。请将其替换为实际的远程分支名称。

如果以上解决方案无效，还可以尝试使用 `git pull` 命令，它会自动执行 `git fetch` 并尝试合并更新到当前分支：

```zsh
git pull origin branch-name
```

同样，`origin` 是远程仓库的名称，`branch-name` 是包含最新提交的远程分支的名称。

如果问题仍然存在，建议检查您的网络连接和远程仓库的状态，以确保能够正常连接和获取更新。

## 删除远端分支
```zsh
acaibird@localhost f2 % git branch --all
a
master
remotes/shop/a
remotes/shop/master
acaibird@localhost f2 %
这个分支remotes/shop/master是在我本地吗,能删除吗中文回答我
```
`remotes/shop/master` 是一个远程分支，它表示在服务器上的 `shop/master` 分支。它并不是在你的本地仓库，而是你本地仓库的一个远程跟踪分支，用于跟踪服务器上的 `shop/master` 分支。因此，你无法直接删除它。

如果你要删除服务器上的 `shop/master` 分支，你可以使用以下命令：

```zsh
git push origin --delete shop/master
```

这个命令会从服务器上删除 `shop/master` 分支。如果你不想删除服务器上的分支，你可以继续保留这个远程跟踪分支。

## 删除远端分支最近三次提交
### 解决方法1：这是删除最新的三个提交才有效 
要删除远程仓库的`changed`分支上的三个提交，您可以按照以下步骤进行操作：

1. 首先，使用以下命令从远程仓库拉取最新的分支信息：

   ```zsh
   git fetch origin changed
   ```

2. 然后，使用以下命令查看要删除的提交的哈希值：

   ```zsh
   git log origin/changed
   ```

   这将列出`changed`分支的所有提交，您需要找到要删除的三个提交的哈希值。

3. 接下来，使用以下命令将`changed`分支重置到要删除的提交的前一个提交：

   ```zsh
   git reset --hard <前一个提交的哈希值>
   ```

   请确保将`<前一个提交的哈希值>`替换为您要删除的第一个提交的哈希值。

4. 然后，使用以下命令将更改推送到远程仓库：

   ```zsh
   git push origin -f changed
   ```
   `-f`标志表示强制推送，这将覆盖远程仓库中的`changed`分支。请注意，这可能会影响其他人的工作，因此请确保在操作之前与团队进行沟通。

这样，您就可以成功地从远程仓库的`changed`分支中删除所需的三个提交。

### 解决方法2 :删除任意三个提交 `git rebase `
非常抱歉我误解了您的问题。如果您要删除远程仓库`changed`分支上的任意三个提交，您可以按照以下步骤进行操作：
1. 使用以下命令获取远程`changed`分支的所有提交记录：

   ```zsh
   git fetch origin changed
   ```

2. 使用以下命令列出`changed`分支的所有提交记录：

   ```zsh
   git log origin/changed
   ```

   这将列出`changed`分支的所有提交记录，包括每个提交的哈希值和提交信息，以便您可以确定要删除的三个提交的哈希值。

3. 使用以下命令创建一个新分支，该分支将从`changed`分支的最新提交开始：

   ```zsh
   git checkout -b temp origin/changed
   # 可以不要这一步
   ```


4. 使用以下命令对新分支进行交互式重写历史记录：

   ```zsh
   git rebase -i HEAD~<提交数目>
   ```

   在这里，`<提交数目>`应该是从最新的提交开始数的三个提交的数量。例如，如果您要删除最新的三个提交，则应将`<提交数目>`设置为3。

   这将打开一个文本编辑器，其中包含新分支的提交历史记录。在编辑器中，将要删除的提交的行修改为`squash`，保存并关闭文件。要删除的提交最晚的一个提交不需要修改成`squash`
5. 使用以下命令将新分支推送到远程仓库：

   ```zsh
   git push -f origin temp:changed
   ```

   这将强制将新分支推送到远程`changed`分支，并覆盖原始的`changed`分支。请注意，这可能会影响其他开发人员的工作，因此请确保在操作之前与团队进行沟通。



6. 最后，删除临时分支：(没有建立临时分支这个也不用要了)

   ```zsh
   git branch -D temp
   ```

   这将删除本地的临时分支。

这样，您就可以成功地从远程仓库的`changed`分支上删除任意三个提交。请注意，这种方法会重写历史记录，因此请确保在操作之前备份重要的数据。

## 查看本地分支和远端分支关联情况
本地分支与远程分支没有关联：`git fetch` 只会更新与当前分支关联的远程分支。如果您的本地分支与远程分支没有明确的关联，`git fetch` 不会自动将更新拉取到本地分支。您可以使用 `git branch -vv` 命令来查看本地分支与远程分支的关联情况。

## 删除本地的部分提交
要从本地 Git 项目中删除一个提交，可以使用 `git reset` 命令。请注意，这将会撤销该提交以及此后的所有提交，并且会永久性地删除它们。因此，在执行此操作之前，请确保您确实希望删除这些提交。

以下是一些可能有用的 `git reset` 命令选项：

1. `git reset --soft <commit>`：此选项将会撤销指定提交及其之后的所有提交，但是不会修改您的工作目录或暂存区。这意味着您可以重新提交这些更改。

2. `git reset --mixed <commit>`：此选项将会撤销指定提交及其之后的所有提交，并且将更改还原到暂存区。这意味着您需要重新提交这些更改。

3. `git reset --hard <commit>`：此选项将会撤销指定提交及其之后的所有提交，并且将更改还原到您上次提交时的状态。这意味着您将永久性地删除这些更改，所以请确保您已经备份了这些更改。

请注意，<commit> 参数可以是提交的 SHA-1 标识符、分支名称或标签名称。

例如，如果您想要删除最新的提交并且撤销它对工作目录和暂存区的影响，您可以运行以下命令：

```zsh
git reset --soft HEAD~1
```

如果您想要彻底删除最新的提交并且永久性地删除它的更改，您可以运行以下命令：

```zsh
git reset --hard HEAD~1
```

请注意，这些命令可能会更改您的 Git 项目历史记录，因此请确保您知道自己在做什么，并且请在执行此类操作之前备份您的项目。

## 取消本地分支与远端分支的关联情况

如果您想要将本地分支 "a" 与远程分支 "a"、"b" 和 "c" 关联，但不再与远程分支 "d" 关联，可以使用以下命令：

```zsh
git branch --unset-upstream d
```

这将取消本地分支 "d" 与远程分支的关联。如果您想要完全删除本地分支 "d"，可以使用以下命令：

```zsh
git branch -d d
```

请注意，如果 "d" 分支上有未合并的更改，则必须使用 `-D` 选项删除该分支，即：

```zsh
git branch -D d
```

如果您要将本地分支 "a" 与另一个远程分支关联，可以使用以下命令：

```zsh
git branch -u <remote_name>/<branch_name> a
```

其中，`<remote_name>` 是远程仓库的名称，`<branch_name>` 是您要关联的远程分支的名称。

## 本地分支关联多个远仓库分支
是的，一个本地分支可以关联多个远程分支。

在Git中，一个本地分支可以与多个远程分支进行关联。这通常会在以下情况下使用：

1. 你想将本地分支推送到多个远程分支，以便在不同的服务器上部署应用程序。
2. 你想在多个远程分支之间同步代码，以便在不同的开发环境中协作开发应用程序。

要将本地分支与多个远程分支关联起来，可以使用以下命令：

```zsh
git branch --set-upstream-to=<remote>/<branch> <local-branch>
```

其中，`<remote>`是远程仓库的名称，`<branch>`是远程分支的名称，`<local-branch>`是本地分支的名称。

例如，要将本地分支`feature`与远程仓库`origin`下的两个远程分支`branch1`和`branch2`关联起来，可以使用以下命令：

```zsh
git branch --set-upstream-to=origin/branch1 feature
git branch --set-upstream-to=origin/branch2 feature
```

这将使得本地分支`feature`能够与远程分支`origin/branch1`和`origin/branch2`进行关联。

## 设置 git 仓库默认分支
```zsh
git config --global init.defaultBranch <name>
```

## Windows 下换行符号和 mac不一样，解决方式
### 问题
git 拉取仓库文件的时候，如果是mac os和window系统同时编辑文件，会导致换行符号不同，而出现不必要的change

### window和类unix的换行符号不同
修改前对这个文件进行处理，将其换行符转换为适合在 Mac 上使用的形式。常用的换行符有两种：Windows 使用回车换行符（CR+LF，\r\n），而 Mac 和 Linux 使用换行符（LF，\n）。

可以使用 `git config` 命令来设置 Git 的自动换行符转换功能，以便在从 Windows 环境中拉取文件时自动将换行符转换为适合在 Mac 环境中使用的形式。执行以下命令即可：

```zsh
git config --global core.autocrlf input
```

这将设置 Git 在检出文件时自动将回车换行符转换为换行符。如果在提交文件时需要将换行符转换回回车换行符，则可以将 `core.autocrlf` 设置为 `true`。

如果已经将文件拉取到本地，可以使用 `dos2unix` 命令将回车换行符转换为换行符，或使用 `unix2dos` 命令将换行符转换为回车换行符。这些命令通常可以在 Mac 上的终端中使用，可以使用 `brew` 包管理器安装它们。例如，执行以下命令将 `example.txt` 文件中的回车换行符转换为换行符：

```zsh
dos2unix example.txt
```

转换后的文件可以在 Mac 上进行修改，然后可以再次使用 `unix2dos` 命令将换行符转换回回车换行符，以便在 Windows 环境中使用。


### 解决方法
#### 配置git config解决
在Git中，换行符有两种常见的形式：Unix风格的LF（Line Feed）和Windows风格的CRLF（Carriage Return 和 Line Feed）。Git默认将所有换行符转换为LF格式，这在大多数情况下都是可以工作的。但在某些情况下，你可能需要使用不同的换行符格式。

要配置Git使用不同的换行符格式，可以使用以下两个配置选项：

1. `core.autocrlf`：指定Git是否应该自动将CRLF转换为LF（在提交时）或LF转换为CRLF（在检出文件时）。这个选项有三个可能的值：

   - `true`：在提交时自动将CRLF转换为LF，在检出文件时自动将LF转换为CRLF。
   - `false`：不进行任何自动转换。
   - `input`：在提交时自动将CRLF转换为LF，但在检出文件时不进行任何转换。

   例如，要设置Git在提交时自动将CRLF转换为LF，在检出文件时不进行任何转换，可以运行以下命令：

   ```zsh
   git config --global core.autocrlf input
   ```

   这将在全局范围内设置`core.autocrlf`选项。

2. `core.eol`：指定Git应该在检出文件时使用的换行符类型。这个选项有两个可能的值：

   - `lf`：使用LF换行符。
   - `crlf`：使用CRLF换行符。

   例如，要设置Git在检出文件时使用CRLF换行符，可以运行以下命令：

   ```zsh
   git config --global core.eol crlf
   ```

   这将在全局范围内设置`core.eol`选项。

请注意，如果你在跨平台开发中使用Git，使用正确的换行符格式非常重要。如果你在Windows上编写代码，但在Linux或macOS上进行构建，那么确保你的代码在不同平台上都可以正常构建和运行，可能需要使用不同的换行符格式。

#### 使用第三方包转换
在 Mac 上，可以使用 `dos2unix` 和 `unix2dos` 工具将文件的换行符进行转换，以便在不同的操作系统之间共享文件时能够正常工作。这些工具通常可以通过命令行安装，例如可以使用 `brew` 包管理器来安装它们。

以下是如何使用 `dos2unix` 和 `unix2dos` 工具将文件的换行符进行转换的步骤：

1. 使用终端进入到存放需要转换的文件的目录下。

2. 执行以下命令安装 `dos2unix` 工具：

   ```zsh
   brew install dos2unix
   ```

3. 执行以下命令将文件中的回车换行符转换为换行符：

   ```zsh
   dos2unix example.txt
   ```

   这将把 `example.txt` 文件中的回车换行符转换为换行符，并保存到同名文件中。

4. 在 Mac 上使用文本编辑器修改文件。

5. 如果需要将文件重新转换为回车换行符的形式，可以执行以下命令安装 `unix2dos` 工具：

   ```zsh
   brew install unix2dos
   ```

6. 执行以下命令将文件中的换行符转换为回车换行符：

   ```zsh
   unix2dos example.txt
   ```

   这将把 `example.txt` 文件中的换行符转换为回车换行符，并保存到同名文件中。

7. 批量转换
执行以下命令批量转换文件夹内所有文件及其子文件夹下的所有文件的换行符：
```zsh
Copy
find . -type f -exec dos2unix {} \;
```
这将在当前目录下查找所有文件，并对每个文件执行 dos2unix 命令，从而将文件中的回车换行符转换为换行符。

需要注意的是，这些工具在转换换行符时可能会修改文件的其他部分。因此，在进行换行符转换之前，应该备份文件的原始副本，并在转换后仔细检查文件的内容，以确保没有意外的修改。

## 配置GMC自动配置和http凭证
[方法](https://docs.github.com/zh/get-started/getting-started-with-git/caching-your-github-credentials-in-git)