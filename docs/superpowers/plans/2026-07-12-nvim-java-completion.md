# Neovim Java Completion Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make `Enter` confirm only an explicitly selected completion item while improving Java `jdtls` project/dependency resolution for Gradle and Lombok-heavy projects.

**Architecture:** Keep `blink.cmp` as the completion engine and override only the parts needed for `Enter` confirmation semantics. Move Java-specific LSP behavior into a focused helper that configures `jdtls` with stable root detection, per-project workspaces, and Lombok-aware JVM args while leaving other language servers unchanged.

**Tech Stack:** Neovim Lua, `saghen/blink.cmp`, `neovim/nvim-lspconfig`, `mason.nvim`, `mason-lspconfig.nvim`, Eclipse JDTLS

## Global Constraints

- Keep `Ctrl-Space` as the completion trigger.
- `Enter` must confirm only an explicitly selected completion item.
- Do not add `Alt-Space` mappings.
- Keep the change minimal and local to the existing Neovim config.
- Improve Java behavior without changing the user's Java project sources.

---

### Task 1: Update completion confirmation behavior

**Files:**
- Modify: `lua/plugins/cmp.lua`

**Interfaces:**
- Consumes: existing `blink.cmp` plugin config
- Produces: `Enter` confirmation behavior based on `blink.cmp`'s `accept` action and explicit completion selection settings

- [ ] Set `completion.list.selection = { preselect = false, auto_insert = false }`.
- [ ] Override `['<CR>'] = { 'accept', 'fallback' }` while keeping the `default` preset.
- [ ] Leave `Ctrl-Space` on the preset-provided `show` behavior.

### Task 2: Add focused Java LSP configuration

**Files:**
- Create: `lua/config/jdtls.lua`
- Modify: `lua/plugins/lsp.lua`

**Interfaces:**
- Consumes: `vim.lsp.config`, Mason-managed `jdtls`, Mason-managed `lombok.jar`
- Produces: a `require('config.jdtls').setup()` helper that configures `jdtls` before `vim.lsp.enable('jdtls')`

- [ ] Detect Java project roots from Gradle/Maven/git markers.
- [ ] Compute a stable workspace directory per project under `stdpath('data')`.
- [ ] Pass `-javaagent:<mason jdtls lombok.jar>` through `JDTLS_JVM_ARGS` when available.
- [ ] Enable Gradle and Maven import plus source download settings that improve external dependency indexing.
- [ ] Keep non-Java LSP server enablement unchanged.

### Task 3: Verify the config end to end

**Files:**
- Verify: `lua/plugins/cmp.lua`
- Verify: `lua/plugins/lsp.lua`
- Verify: `lua/config/jdtls.lua`

**Interfaces:**
- Consumes: headless Neovim and the existing Java project at `~/Dev/arenax-be`
- Produces: evidence that the config loads and the Java project gets a Lombok-aware `jdtls` setup

- [ ] Run headless Neovim to ensure the config loads without Lua errors.
- [ ] Inspect the registered `jdtls` config to confirm root markers, command, workspace handling, and Lombok env wiring.
- [ ] Re-check diagnostics in the Java project files that were previously red.
