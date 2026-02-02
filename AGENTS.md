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
Content lives under numbered domains: `01-閸╄櫣顢呯拠顓熺《/` through `08-瀹搞儱鍙挎稉搴ゎ吀閸?`, plus `09-閹垛偓閼宠棄寮懓?` for Obsidian/JSON Canvas skills. Each domain contains ordered subfolders (for example `03-闂堛垹鎮滅€电钖?20-缂佈勫娑撳骸顦块幀?婢舵碍鈧?instanceof閻劍纭?md`). Root hosts contributor docs (`AGENTS.md`, `structure-plan.md`, `INDEX.md`, `search-guide.md`), the CSV inventory, and helper scripts. When adding a note, choose the domain, drop it into the proper `10-`/`20-` second-level folder, and keep filenames in the `娑撳顣?鐟曚胶鍋?md` pattern.

## Build, Test, and Development Commands
- `rg -n "<term>" 03-闂堛垹鎮滅€电钖?--glob "*.md"` 閳?find references by domain while ignoring front matter noise.
- `npx markdownlint "**/*.md"` 閳?enforce heading spacing; append `--fix` only after reviewing diffs.
- `npx prettier --check "**/*.md"` 閳?optional formatting verification for collaborators editing in VS Code.
- `powershell -NoProfile -ExecutionPolicy Bypass -File ./scripts/list-by-tag.ps1 -Tag 閸╄櫣顢呯拠顓熺《` 閳?list all notes sharing a tag before curating `INDEX.md`.
- For runnable snippets, park them beside the note under `code/` or `snippets/` and validate with `javac Demo.java && java Demo`.

## Coding Style & Naming Conventions
Use two-level headings max (`##`/`###`), bullets for comparisons, and fenced blocks tagged `java` or `shell`. Keep code indented with 4 spaces and camelCase identifiers. Highlight key terms in **bold** sparingly. File names stay descriptive and bilingual if needed (`鐟佸懐顔?閼奉亜濮╅幏鍡欘唸闂勭兘妲?md`), while metadata front matter must include `title/category/topic/created/reviewed/tags/status` exactly as shown in `structure-plan.md`.

## Testing Guidelines
Before closing a note, lint it, run any referenced code, and capture sample input/output. Algorithm entries must include娑撯偓濞堝吀鍚夋禒锝囩垳閹?Java 閺傝纭舵禒銉ュ挤妫板嫭婀＄紒鎾寸亯鐞涖劊鈧繂rack open issues with a `TODO:` list at the bottom and remove it once verified.

## Commit & Pull Request Guidelines
Follow Conventional Commits: `docs(閹貉冨煑濞?: add switch cheat sheet`. PRs should describe scope, link impacted files (e.g., `03-闂堛垹鎮滅€电钖?20-缂佈勫娑撳骸顦块幀?**`), list verification commands (`rg`, `markdownlint`, `javac`), and attach screenshots for diagram updates. Request reviewers familiar with the module and wait for at least one approval.

## Agent Workflow Tips
Sync Obsidian before editing, pause sync while running lint/tests, and confirm no credentials remain via `rg -n "鐎靛棛鐖? -g"*.md"`. Update `notes-inventory.csv` whenever you add or remove notes, and refresh `INDEX.md` so newcomers can discover the material quickly.


