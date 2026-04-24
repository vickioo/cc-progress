---
title: RAYLINE Theme 攻坚
---

# RAYLINE Theme 攻坚

**Status**: 🟢 active
**Last Updated**: 2026-04-24 23:10
**Last Session**: ws-a dispatch (cc-ts)

## 目标

统一 RAYLINE 前端主题系统：ThemeContext + themeBootstrap + 多入口注入（main / pm-main / terminal-main），消除样式分裂；同时收口 react-hooks lint 阻塞。

## 当前阶段

- WS-0 theme 基础：commit 已打、push 被 gh workflow scope 卡（fork 带历史 workflow 文件）
- WS-A Settings Sidebar：cc-ts 远端 Codex 已 commit 本地，等 push 凭据
- Hooks 攻坚：Tier1 / Tier2+3 / T3-twins 三波已 commit 在本地分支，总错误 68 → 46

## 已完成（最近 5 项）

- ✅ WS-0 theme：ThemeContext/themeBootstrap/三入口注入/index.css/Settings.jsx（commit `3debeb2`）
- ✅ Hooks Tier1：rules-of-hooks 7 处（`MermaidBlock` + `ValueControlBlock`，commit `6af6f98`，68→60）
- ✅ Hooks Tier2+3：per-file review，Class A 1 处修、Class B 5 处带 reason 豁免、Class C 列清单（commit `55f41ac`，60→50）
- ✅ Hooks T3-twins：抽 `useOptimisticList` hook 给 IssueList/PRList 共用（commit `42b0fcf`，50→46）
- 🟡 WS-A Settings Sidebar：Settings/Sidebar/SidebarChromeRail/index.css token 替换，build pass lint delta=0（cc-ts commit `7ca5cb9`）

## 进行中 / Active Team

**Updated**: 2026-04-24 23:10

| 角色 | 执行者 | 当前任务 | 分支/PID | 状态 |
|------|--------|---------|---------|------|
| Leader | Opus (参谋长) | 审 5 份 handoff、决策 push 策略 | 主线 | 不下场 |
| Worker-Remote | cc-ts Codex `--yolo` | WS-A Settings Sidebar 主题 token 替换 | `theme/ws-a-settings-sidebar` / PID 1622733 (cc-ts) | 🟡 commit `7ca5cb9` 本地 OK，push 阻塞（HTTPS 无凭据） |
| Worker-Local | 本地 Codex | long-running (09:29 起) | - / PID 45977 (Mac) | 🟢 常驻 |
| MCP | Codex mcp-server | MCP 服务 | - / PID 41229 (Mac) | 🟢 常驻 |
| Reviewer | vicki | 决策 push/lint 放行策略 | - | 待 |

**本地分支快照**（`/Users/vicki/service/RAYLINE`）:
- `theme/ws0-foundation` — WS-0 基础，未 push
- `chore/hooks-tier1-rules` — `6af6f98`
- `chore/hooks-tier2-review` — `55f41ac`
- `chore/hooks-t3-issuelist-prlist` — `42b0fcf`（当前 HEAD）
- cc-ts `theme/ws-a-settings-sidebar` — `7ca5cb9`

**Pending handoff files**（下次启动扫这些）:
- `/tmp/handoff-ws0.json` — WS-0 实现，lint 阻塞
- `/tmp/handoff-ws0-push.json` — push 失败根因：gh token 无 workflow scope + fork 历史含 workflow 改动
- `/tmp/handoff-hooks-fix.json` — 初次 PR167 任务规格错误，已终止
- `/tmp/handoff-hooks-tier1.json` — Tier1 完成
- `/tmp/handoff-hooks-tier2.json` — Tier2+3 完成
- `/tmp/handoff-hooks-t3-twins.json` — twins hook 完成
- `/tmp/handoff-pr167.json` — PR167 rebase 中止
- `/tmp/handoff-ws-a.json` (cc-ts) — WS-A 完成，push 阻塞
- `/tmp/cc-ts-ws-a-dispatch.json` — cc-ts 派工元数据

**Next actions**（任何人接手的第一步）:
1. vicki 侧：`gh auth refresh -s workflow -h github.com`（解 WS-0 push），或给 `vickioo` 开 EnSue-Laboratories/RAYLINE 写权限
2. cc-ts 侧：给 Codex 远端 `~/.config/gh/hosts.yml` 配 token（解 WS-A push）
3. WS-0 / Tier1 / Tier2+3 / T3-twins 四个本地分支 push + 开 PR（顺序提交，每个独立 review）
4. Hooks Tier2 Class C deferred 清单（App.jsx/ChatArea/DispatchCard/GitStatusPill/MulticaSetupModal/NewChatCard，合计 19 处）— 待 vicki 决定是否单独立项
5. 主题切换 e2e（Settings 切主题 → 三入口实际生效）

## 阻塞项

- **push 阻塞**：gh token 缺 workflow scope；vickioo fork 含历史 workflow 改动
- **cc-ts 凭据缺失**：远端 HTTPS origin 无 credentials，WS-A 推不出
- **Class C 19 处 hooks**：App.jsx 9 处 3605 LOC 需拆 `useConversationSync` 等新 hook，单独立项

## 关联资源

- Repo: https://github.com/EnSue-Laboratories/RAYLINE (upstream), https://github.com/vickioo/RAYLINE (fork)
- Handoff: `/tmp/handoff-ws0*.json` / `/tmp/handoff-hooks-*.json` / `/tmp/handoff-pr167.json` / `/tmp/handoff-ws-a.json`
- Lint baseline: main 68 errors → 当前 HEAD 46 errors（本地分支）
- MEMORY: `project_rayline_contribution_tracking.md`（若存在）

## 决策日志

- 2026-04-24: cc-ts 远端派工 WS-A 完成本地 commit，push 阻塞；本地 hooks 三波共降 22 errors（68→46）
- 2026-04-24: WS-0 实现完成，push 被 gh workflow scope 阻塞，等 vicki 决策
- 2026-04-24: 初次 hooks-fix 任务规格错误（错把 react-hooks 子集当全集），重新拆 Tier1/2/3 执行
