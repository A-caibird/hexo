#!/bin/bash

# 执行a命令
hexo generate

# 检查a命令是否执行成功
if [ $? -eq 0 ]; then
    # 复制./public目录的所有内容到../GithubPages
    cp -r ./public/* ../GithubPages

    # 在../GithubPages下执行git add .
    cd ../GithubPages

    git add .
    git commit -m "update blog"
    if [ $? -eq 0 ]; then
        echo "git commit命令执行成功!"
    else
        echo "git commit命令执行失败!"
    fi
    git push origin main:main
    if [ $? -eq 0 ]; then
        echo "git push命令执行成功!"
    else
        echo "git push命令执行失败!"
    fi
else
    echo "a命令执行失败"
fi
