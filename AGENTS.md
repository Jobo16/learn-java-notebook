# Repository Guidelines

## Project Structure & Module Organization
This vault is intentionally flat: single-topic Markdown briefs sit at the root (for example `BigDecimal-doc.md` or `字段.md`), while bundled themes use folders such as `牛客算法/` for algorithm drills, `类/` for OOP case studies, and `自动拆装箱的内存开销和泛型不支持基本类型的本质/` for generics/autoboxing research. Add new clusters in their own folder, and mirror the existing descriptive, Chinese-first naming so Obsidian graphs stay meaningful.

## Build, Test, and Development Commands
- `rg -n "<term>" **/*.md` — audit overlaps or cite prior notes fast.
- `npx markdownlint "**/*.md"` — enforce heading hierarchy and spacing; add `--fix` only after reviewing.
- `npx prettier --check "**/*.md"` — optional formatting verification for VS Code contributors.
- For runnable Java snippets, stage them under `scratch/` and run `javac scratch/Demo.java && java Demo` to ensure output matches the doc.

## Coding Style & Naming Conventions
Keep sections short with `##` headings and bullets, highlight concepts in bold, and prefer fenced code blocks tagged with `java` or `shell`. Use 4-space indentation in code, camelCase variables inside snippets, and inline comments sparingly to explain intent. Name files after the concrete concept (`方法签名.md`, `equal().md`), avoiding spaces at the start or trailing punctuation.

## Testing Guidelines
Lint every touched file, then proofread for logical accuracy and duplicate coverage. When documenting algorithms, include a sample input/output table plus the verified Java method or pseudocode you executed locally. Track open work with a `TODO:` block at the end of the note and replace it with finalized prose once satisfied.

## Commit & Pull Request Guidelines
The repo currently lacks Git history, so begin using Conventional Commits immediately (e.g., `docs(泛型): clarify 协变`). PRs should describe the learning goal, reference related notes via wikilinks, list any commands run (lint, javac), and attach screenshots if a canvas or diagram changed. Request a topic-aware reviewer and wait for at least one approval before merging.

## Agent Workflow Tips
Sync Obsidian before editing, pause sync while running lint commands, and confirm no confidential strings remain by running `rg -n "密码" **/*.md` prior to pushing. Favor small, topic-scoped PRs so reviewers can fact-check quickly.

