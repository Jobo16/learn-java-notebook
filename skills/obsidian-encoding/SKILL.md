---
name: obsidian-encoding
description: Diagnose and prevent encoding regressions when editing Obsidian Markdown via PowerShell or scripts; keep every note in UTF-8 so rg, git, and editors render Chinese correctly.
---

# Obsidian Encoding Skill

This skill explains why Markdown notes may突然变成“瀹氫綅”样的乱码，以及如何避免和修复。

## When To Use
- 批量重写 `.md` / `.csv` / `.json`，尤其是在 PowerShell 中使用 `Set-Content`、`Out-File`、`>` 时。
- Obsidian、VS Code 或 `rg` 突然无法正确显示中文。
- 需要注入 front matter 或脚本化修改笔记时。

## Root Cause
- PowerShell cmdlet 默认编码为 UTF-16 LE，未显式指定 `-Encoding` 会覆盖原有 UTF-8。
- Git diff 会自动检测编码，因此容易误以为文件没问题，直到其他工具按 UTF-8 读取才暴露。

## Prevention
1. **强制指定编码**
   ```powershell
   Set-Content -Encoding UTF8 -Path note.md -Value $text
   ```
2. **设置会话默认值**
   ```powershell
   $PSDefaultParameterValues['*:Encoding'] = 'utf8'
   ```
3. **编辑器约束**：在 `.editorconfig` 中为 `*.md` 指定 `charset = utf-8`，确保 IDE/Obsidian 保存时保持 UTF-8。
4. **流程约束**：skills/ 目录等外部来源文档若无需整理，避免批量脚本触碰。

## Detection
- `file -bi note.md` 或 `Get-Content note.md -Encoding byte -TotalCount 1`，若输出 `utf-16le` 表示已被污染。
- `rg "瀹" -g"*.md"` 这类稀有字符搜索，可快速定位乱码文件。
- `git show <good-commit> -- path/to/file.md` 可查看最后的 UTF-8 正文以便对比。

## Recovery Workflow
1. 取出干净版本内容：`git show <good-commit>:path/to/file.md > clean.md`。
2. 保留需要的新 front matter/改动。
3. 使用 UTF-8 写回：
   ```powershell
   $body = Get-Content clean.md -Raw
   Set-Content -Encoding UTF8 path/to/file.md ($frontMatter + "`n" + $body)
   ```
4. 重新生成 `notes-inventory.csv` 等派生文件，保持统计一致。

## Automation Ideas
- 编写 `scripts/assert-utf8.ps1`：
  ```powershell
  Get-ChildItem -Recurse -Filter *.md |
    Where-Object { (Get-Content $_.FullName -Encoding byte -TotalCount 1)[0] -eq 255 }
  ```
  若结果非空，说明存在 UTF-16 文件（BOM=0xFFFE）。
- 在 pre-commit hook 中运行验证（例如 `iconv -f utf-16le -t utf-8`），失败则阻止提交。

## Scope
- 适用于 Obsidian 笔记库、任何脚本批量维护的文档项目以及混合 Windows/Unix 工具链的团队。
- 可作为排查、培训、流程自动化的参考。
