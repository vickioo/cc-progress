---
title: CC Progress Hub
---

# CC Progress Hub

> 跨会话的项目进度档案。会话断线/切换后，从这里捡起来继续干。

**Last Updated**: 2026-04-24 23:10

## 主线项目一览

| 项目 | 状态 | 负责阶段 | Active Team | 链接 |
|------|------|---------|------------|------|
| RAYLINE Theme 攻坚 | 🟢 active | WS-A Settings Sidebar 远端跑中 / hooks Tier1-3 已就位 46 err | cc-ts Codex (PID 1622733) + 本地 Codex (PID 45977) | [RAYLINE_THEME](./RAYLINE_THEME.md) |
| 飞书 Session 2M 优化 | 🟡 blocked | P1 设计完成，/compact+/insights+软边界待实施 | 无人在跑（排期等 RAYLINE 收口） | [FEISHU_SESSION](./FEISHU_SESSION.md) |
| 飞书 Wiki 分发 | ⚪ paused | 已搁置，转 GitHub Pages | 无 | [WIKI_DISTRIBUTION](./WIKI_DISTRIBUTION.md) |
| aiHub 知识 & Gateway | 🟢 active | Phase 0+1 完成，Gateway v3 待绑域名 | 无（等 vicki 域名决策） | [AIHUB](./AIHUB.md) |
| mycc 基础设施 | 🟢 active | progress hub 启动 + session 转移诊断完成 | Opus 主线 | [MYCC_INFRA](./MYCC_INFRA.md) |

## 全量 Active Team 快照

**Updated**: 2026-04-24 23:10

| 进程 | 执行者 | 项目 | 任务 | 证据 |
|------|--------|------|------|------|
| Mac PID 45977 | 本地 Codex `--dangerously-bypass-approvals-and-sandbox` | RAYLINE / 其他 | 长驻 codex cli (09:29 起) | `ps aux \| grep codex` |
| Mac PID 41229 | Codex mcp-server | mycc 内嵌 | MCP 服务常驻 | `ps aux` |
| cc-ts PID 1622733 | 远端 Codex `--yolo` | RAYLINE WS-A | Settings Sidebar 主题 token 替换 | `ssh cc-ts ps`, `/tmp/handoff-ws-a.json` |
| Opus (主线程) | 本会话 | 参谋长 | 审查 handoff + 刷 progress hub | 本任务 |

**Pending handoff files**（下次启动扫这些）:
- `/tmp/handoff-ws0.json` / `/tmp/handoff-ws0-push.json` — RAYLINE WS-0 theme 基础（commit 3debeb2，push 被 gh workflow scope 阻塞）
- `/tmp/handoff-hooks-fix.json` — PR167 误规格终止
- `/tmp/handoff-hooks-tier1.json` — Tier1 rules-of-hooks 7 处（commit 6af6f98，68→60）
- `/tmp/handoff-hooks-tier2.json` — Tier2+3 per-file review（commit 55f41ac，60→50）
- `/tmp/handoff-hooks-t3-twins.json` — IssueList/PRList useOptimisticList hook（commit 42b0fcf，50→46）
- `/tmp/handoff-pr167.json` — PR167 rebase lint 失败
- `/tmp/handoff-ws-a.json` (cc-ts) — WS-A Settings Sidebar 本地 commit 7ca5cb9，push 阻塞（HTTPS 无凭据）
- `/tmp/cc-ts-ws-a-dispatch.json` — cc-ts WS-A 派工信息（2026-04-24）
- `/tmp/feishu-session-diag.json` + `/tmp/feishu-session-redesign.md` — FEISHU SESSION 重设计完整
- `/tmp/session-transfer-diagnostic.md` — 2MB 切会话影响面分析
- `/tmp/wiki-repair-result.json` / `/tmp/wiki-ingest-result-v2.json` — wiki 迁移阻塞在文档 ACL

## 约定

- 所有页面结构见 [`_TEMPLATE.md`](./_TEMPLATE.md)
- 决策日志 **append-only 反向时间**（新在上）
- 进行中项写清 **分支 / PID / 负责 agent**
- 团队分工章节必须有 handoff 或 ps 证据，禁编造

## 同步机制

- 写入：本仓 `git push`（mirror `vickioo/cc-progress`，独立于 mycc 主仓）
- 读取：会话启动时 CC 读 INDEX.md，按需展开
- 自动化：见 [`update-progress.sh`](./update-progress.sh)（`sync` 命令已就绪）
