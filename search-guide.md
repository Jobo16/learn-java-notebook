---
title: search-guide
category: root
topic: root
created: 2026-02-02
reviewed: 2026-02-02
tags: [java, search]
status: active
---

# 搜索与检索指南

## ripgrep (`rg`)
- 按标题关键字：`rg -n "title: .*多态" 03-面向对象`
- 快速查找示例代码：`rg -n "public static" 03-面向对象 --glob "*.md"`
- 排除元数据：`rg -n "try" 02-控制流与异常 --no-heading --after-context 2 --before-context 2`

## fd / Get-ChildItem
- 模糊查找文件：`fd --extension md 自动拆箱`
- PowerShell：`Get-ChildItem -Recurse -Filter *多态*.md`

## CSV 清单
- `notes-inventory.csv` 支持通过 Excel/Sheets 过滤，如按 `Category` 或 `WordCount` 排序，寻找薄弱主题。

## 标签脚本
- 运行 `powershell -NoProfile -ExecutionPolicy Bypass -File ./scripts/list-by-tag.ps1 -Tag 基础语法` 输出匹配标签的笔记及路径。
- 将结果重定向以备份：`powershell -NoProfile -ExecutionPolicy Bypass -File ./scripts/list-by-tag.ps1 -Tag 算法 > tag-算法.txt`。

## Obsidian 内部跳转
- 根目录入口：先看 `README.md` 了解结构与流程。
- 每篇笔记头部的 `title` 与 Obsidian 搜索同步，可用 `title:"方法-重写示例"` 直接定位。
- 使用 Graph view，按 `tag:基础语法`、`tag:算法练习` 过滤即可映射知识块。

