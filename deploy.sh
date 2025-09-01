#!/bin/bash

# 清理旧文件
echo "清理缓存..."
hugo clean

# 生成新的静态文件
echo "生成静态文件..."
hugo

# 启动本地预览
read -p "是否启动本地预览? (y/n): " preview_choice
if [ "$preview_choice" = "y" ] || [ "$preview_choice" = "Y" ]; then
  echo "启动本地预览服务(按Ctrl+C停止)..."
  hugo server -D
fi

# 提示用户检查更改
read -p "确认要提交并推送更改吗? (y/n): " confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
  echo "取消部署操作."
exit 1
fi

# 提交主仓库的更改
echo "提交主仓库更改..."
git add .
git commit -m "更新于: $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main

echo "代码已推送到主仓库，GitHub Actions将自动部署到GitHub Pages!"
