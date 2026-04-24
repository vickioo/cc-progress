---
title: aiHub 项目
---

# aiHub 项目

**Status**: 🟢 active
**Last Updated**: 2026-04-24 23:10
**Last Session**: -

## 目标

统一 AI 能力门面：知识库（Phase 0-3）+ Gateway v3.0（6 服务收编）+ portal/JWT/MessageBus；2026-04-20 定案巡检 Team 架构（Leader Sonnet + 4 Soldiers）。

## 当前阶段

- **知识**：Phase 0 + Phase 1 完成（NIM embedding + sqlite-vec）
- **Gateway v3.0**：6 服务收编为 `:8888`，portal/knowledge/hub代理/JWT/MessageBus 已搭，**待绑定 `ai.whtaibang.top`**
- **巡检 Team**：架构已定案（2026-04-20），未实装

## 已完成（最近 5 项）

- ✅ Phase 0：aiHub 结构奠基
- ✅ Phase 1：NIM embedding + sqlite-vec 检索
- ✅ Gateway v3 六服务收编（portal/knowledge/hub/JWT/MessageBus + 一项）
- ✅ Keychain 密钥指针落地
- ✅ `/aihub` skill（查状态/启停 uvicorn + cloudflared）

## 进行中 / Active Team

**Updated**: 2026-04-24 23:10

| 角色 | 执行者 | 当前任务 | 分支/PID | 状态 |
|------|--------|---------|---------|------|
| Leader | Opus (参谋长) | 等 vicki 域名决策 | - | 不下场 |
| Worker | — | — | — | 未派工 |
| 巡检 Team (规划中) | Sonnet Leader + 4 Soldiers (Haiku/Codex/脚本) | P0 才升级 Opus | — | 架构定案未实装 |

**Pending handoff files**（本项目无 handoff 产出，从 MEMORY 摘要）:
- MEMORY `project_aihub_knowledge.md` — Phase 0+1 完成证据
- MEMORY `project_aihub_gateway_v3.md` — 6 服务收编清单
- MEMORY `project_aihub_team_architecture.md` — 2026-04-20 架构定案
- MEMORY `feedback_aihub_data_sovereignty.md` — 数据边界（aiHub 私有、个人数据只留家庭设备）

**Next actions**（任何人接手的第一步）:
1. 绑定 `ai.whtaibang.top` → cloudflared tunnel（等 vicki 执行 DNS 或授权 CC 做）
2. 启动 aiHub 巡检 Team 脚手架（Leader Sonnet + 4 Soldiers）
3. 继续 Phase 2-3 知识体系（图谱化 / dream 去重，参见 `project_knowledge_dedup_dream.md`）

## 阻塞项

- 域名 DNS 解析 / Cloudflare tunnel 绑定操作待执行
- 巡检 Team 实装需 Sonnet 持续用量预算确认

## 关联资源

- Repo: https://github.com/vickioo/aiHub (private)
- Skill: `.claude/skills/aihub/`
- Memory: `project_aihub_knowledge.md`, `project_aihub_gateway_v3.md`, `project_aihub_team_architecture.md`, `feedback_aihub_data_sovereignty.md`

## 决策日志

- 2026-04-24: 刷 progress hub，明确"无 handoff、从 MEMORY 摘要"
- 2026-04-20: 巡检 Team 架构定案（Leader + 4 Soldiers 双层）
