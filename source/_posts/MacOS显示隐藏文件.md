---
title: MacOS显示隐藏文件
date: 2023-11-21 14:38:07
tags:
 - MasOS
 - Linux
categories:
 - Mac
 - MacOs
summary: MacOS显示隐藏文件
---
在 macOS 上，隐藏文件和文件夹默认情况下是不可见的，但你可以通过以下方法来永久显示所有隐藏文件：

1. 打开“终端”应用程序。你可以在“应用程序”文件夹下的“实用工具”文件夹中找到它。

2. 输入以下命令并按下回车键：

```bash
defaults write com.apple.finder AppleShowAllFiles -bool YES
```

3. 输入以下命令来重新启动 Finder（文件管理器）：

```bash
killall Finder
```

Finder 将会重新启动，并且你将能够看到所有的隐藏文件和文件夹。它们会以半透明的方式显示。

如果你想恢复隐藏文件的默认设置，可以重复上述步骤，并将命令中的 `-bool YES` 替换为 `-bool NO`，然后重新启动 Finder。

请注意，显示所有隐藏文件可能会让你的文件系统看起来杂乱无章，因此在完成任务后，最好将隐藏文件设置为默认不可见的状态。