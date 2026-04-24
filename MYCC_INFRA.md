---
title: mycc 基础设施
---

# mycc 基础设施

**Status**: 🟢 active
**Last Updated**: 2026-04-24 23:10
**Last Session**: current

## 目标

mycc（Claude Code 跨设备小程序后端）基础设施建设：会话通道、HTTP server、飞书/微信桥接、进度档案、nana DM 通道、飞书 bot 菜单。

## 当前阶段

- 本次会话：progress hub 刷新 + mirror 同步
- 飞书 bot 菜单文档已就位（详见下）
- nana DM 通道产出：飞书 bot 菜单路由 `feishu-menu-router.ts` 已在仓
- session 转移诊断完成（`/tmp/session-transfer-diagnostic.md`）

## 已完成（最近 5 项）

- ✅ approval-bridge HMAC token 协议同步上游（commit `4d53903`）
- ✅ usage-report v1.3.1：B 卡回滚 grouped-bar、A 卡保留 line-chart（`1cc98e3`）
- ✅ usage-report v1.3.0：dogfood lib/builders（`40dab3c`）
- ✅ morning-report.js → morning-report.cjs 重命名
- ✅ session 转移影响面诊断完成（无 kill 风险，回调仍可达飞书；跨 turn 语义引用需派工回收）
- ✅ progress hub infra（docs/progress/ + mirror `vickioo/cc-progress` + update-progress.sh sync 命令）

## 进行中 / Active Team

**Updated**: 2026-04-24 23:10

| 角色 | 执行者 | 当前任务 | 分支/PID | 状态 |
|------|--------|---------|---------|------|
| Leader | Opus (参谋长) | 刷 progress hub + 派工 | `agent/b5-feishu-docx` | 本会话 |
| Worker-Local | 本地 Codex (长驻) | mycc 相关支持任务 | - / PID 45977 | 🟢 常驻 |
| MCP | Codex mcp-server | MCP 服务 | - / PID 41229 | 🟢 常驻 |

**Working tree modified**（未 commit，下次整理）:
- `.claude/skills/` 多项（README / cc-usage / feishu-docx / mycc 脚本 / usage-report / tell-me）
- `.claude/skills/mycc/scripts/src/channels/feishu-streaming.ts` / `feishu.ts` / `http-server.ts` / `index.ts`
- `ecosystem.config.cjs` / `scripts/patrol-v2.sh` / `scripts/morning-report.cjs`
- `docs/FAQ.md` / 若干 progress / dashboard-data JSON

**Pending handoff files**（下次启动扫这些）:
- `/tmp/session-transfer-diagnostic.md` — 2MB 切会话影响面 + 派工回收方案
- `/tmp/feishu-session-diag.json` / `/tmp/feishu-session-redesign.md` — FEISHU_SESSION 设计（本项目关联）

**Next actions**（任何人接手的第一步）:
1. progress hub mirror push 完成（本次）+ Pages 构建等 1-2 min 自动跑
2. 把 working tree 一批 modified 文件整理成几个合理 commit（独立任务，非本会话）
3. `update-progress.sh` 增强：扫 `/tmp/handoff-*.json` 自动填充团队表（当前手工）
4. 派工回收机制（见 FEISHU_SESSION P3）：`~/.mycc/pending-agents/*.json` 登记入口

## 阻塞项

- 无（本任务独立于主业务）

## 关联资源

- Repo: https://github.com/vickioo/mycc (private)
- Progress Mirror: https://github.com/vickioo/cc-progress (public)
- Pages: https://vickioo.github.io/cc-progress/
- Branch: `agent/b5-feishu-docx`
- 最近 commits: `4d53903`, `1cc98e3`, `40dab3c`, `c2ff49f`, `b490fd4`

## 决策日志

- 2026-04-24: progress hub 全量刷新（6 MD + 团队分工章节 + handoff 证据链），mirror sync
- 2026-04-24: session 转移诊断——L343-384 切会话不 kill 任何进程，回调不依赖 sessionId
- 2026-04-24: 启动 progress hub，选 public 独立 repo `vickioo/cc-progress` 做 Pages host（mycc 本身 private）
