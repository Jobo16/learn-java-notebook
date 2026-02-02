---
title: README
category: root
topic: root
created: 2026-02-02
reviewed: 2026-02-02
tags: [java, root]
status: active
---

## 项目简介
- Java 学习笔记仓库，配合 Obsidian 阅读与整理。
- 内容按编号领域与分层目录组织。
- 根目录文件记录结构、索引与检索方式。

## 目录约定
- 顶层目录为 `01-基础语法` 到 `08-工具与计划`。
- 每个领域包含 `10-概览`、`20-实践`、`30-参考` 等分层。
- 笔记命名使用 `主题-要点.md`。

## 快速检索
- 使用 `rg` 或 Obsidian 搜索定位笔记。
- 标签统计使用脚本输出。

```shell
    rg -n "title: .*多态" 03-面向对象 --glob "*.md"
    powershell -NoProfile -ExecutionPolicy Bypass -File scripts/list-by-tag.ps1 -Tag 基础语法
```

## 维护流程
- 新增或移动笔记后更新 `INDEX.md`、`structure-plan.md`、`search-guide.md`、`notes-inventory.csv`。
- 批量编辑后运行 markdownlint 与 prettier 检查。
- 编辑前暂停 Obsidian 同步，提交后恢复。
- 提交前保持 `git status -sb` 干净。

```shell
    npx markdownlint "**/*.md"
    npx prettier --check "**/*.md"
```