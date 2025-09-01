#!/bin/bash

# 清理旧文件
echo "清理缓存..."
hugo clean

# 生成新的静态文件
echo "生成静态文件..."
hugo

# 提交主仓库的更改
echo "提交主仓库更改..."
git add .
git commit -m "更新于: $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main

echo "代码已推送到主仓库，GitHub Actions将自动部署到GitHub Pages!"
