---
title: .editorconfig文件控制代码格式
tags:
  - 代码格式控制
categories:
  - null
date: 2023-12-05 14:13:02
summary: .editorconfig文件控制代码格式
---

文件根目录新建`.editorconfig文件`,键入以下内容:
```
root = true

[*]
charset = utf-8
end_of_line = lf
indent_size = 4
indent_style = space
insert_final_newline = false
max_line_length = 140
tab_width = 4

[*.less]
indent_size = 4

[*.sass]
indent_size = 4

[*.scss]
indent_size = 4

[*.vue]
indent_size =  4
tab_width = 4

[{*.bash,*.sh,*.zsh}]
indent_size = 4
tab_width = 4

[{*.har,*.jsb4,*.jsb3,*.json,.babelrc,.eslintrc,.prettierrc,.stylelintrc,bowerrc,jest.config}]
indent_size = 4

[{*.http,*.rest}]
indent_size = 4

[{*.yaml,*.yml}]
indent_size = 4

```