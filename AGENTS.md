---
title: AGENTS
category: root
topic: root
created: 2026-02-02
reviewed: 2026-02-02
tags: [java, root]
status: active
---

# Repository Guidelines

## Project Structure & Module Organization
Content lives in numbered domains `01-基础语法` … `08-工具与计划` with lanes such as `10-概览`, `20-实践`, and `30-参考`. Add notes inside the correct domain/lane (for example `03-面向对象/20-模式与实践`) and keep filenames in the `主题-要点.md` pattern. Update `INDEX.md`, `structure-plan.md`, `search-guide.md`, and `notes-inventory.csv` whenever files move or metadata changes. `scripts/` hosts helper PowerShell utilities, while `skills/` stores standalone agent skills and stays out of routine reorganizations.

## Build, Test, and Development Commands
`git status -sb` keeps the local-only history clean. Scope searches with `rg -n "<term>" 07-算法练习 --glob "*.md"` (swap folders as needed). Generate tag reports via `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/list-by-tag.ps1 -Tag 基础语法` and compare the output to `notes-inventory.csv`. Run `npx markdownlint "**/*.md"` and `npx prettier --check "**/*.md"` after each editing batch; add `--fix` only after reviewing diffs.

## Coding Style & Naming Conventions
Start every Markdown file with YAML front matter listing `title`, `category`, `topic`, `created`, `reviewed`, `tags`, and `status`, matching the latest notes. Limit headings to `##`/`###`, keep bullet sentences short, and fence code with triple backticks labeled `java` or `shell`. Indent snippets with 4 spaces and use camelCase identifiers. Follow the existing name/description SKILL template when editing `skills/*/SKILL.md`, and never relocate those files.

## Testing Guidelines
Include the command used to verify runnable Java (e.g., `javac Demo.java && java Demo`) plus representative input/output. Algorithm notes under `07-算法练习` must state time/space complexity and at least two test cases; leave a TODO list only while issues remain. Rerun linters and referenced commands before updating `INDEX.md` or marking front matter "reviewed".

## Commit & Pull Request Guidelines
Use Conventional Commit messages like `docs: fix note encodings` or `docs(05-数值处理): add BigDecimal pitfalls`. Keep each commit scoped to one domain and list verification steps (lint, tag script, sample runs) in the body. With no remote, share branches directly or export patches via `git format-patch`, and confirm `git status -sb` is clean before handoff.

## Agent-Specific Instructions
Pause Obsidian sync while editing, resume after committing, and scan for sensitive leftovers with `rg -n "TODO" -g "*.md"` or targeted keywords. Keep `notes-inventory.csv` aligned with the folder tree, log new lanes in `structure-plan.md`, and record operational fixes inside SKILL docs instead of scattering them across study notes.
