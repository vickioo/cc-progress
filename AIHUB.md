---
title: aiHub 项目
---

# aiHub 项目

**Status**: 🟢 active
**Last Updated**: 2026-04-24
**Last Session**: -

## 目标

统一 AI 能力门面：知识库（Phase 0-3）+ Gateway v3.0（6 服务收编）+ portal/JWT/MessageBus。

## 当前阶段

- **知识**：Phase 0 + Phase 1 完成（NIM embedding + sqlite-vec）
- **Gateway v3.0**：6 服务收编为 `:8888`，portal/knowledge/hub代理/JWT/MessageBus 已搭，**待绑定 `ai.whtaibang.top`**

## 已完成

- Phase 0：aiHub 结构奠基
- Phase 1：NIM embedding + sqlite-vec 检索
- Gateway v3 六服务收编（portal/knowledge/hub/JWT/MessageBus + 一项）
- Keychain 密钥指针落地
- `/aihub` skill（查状态/启停 uvicorn + cloudflared）

## 进行中

- 域名 `ai.whtaibang.top` 绑定
- Phase 2-3 知识体系建设

## 阻塞项

- 域名 DNS 解析 / Cloudflare tunnel 绑定操作待执行

## 下一步

1. 绑定 `ai.whtaibang.top` → cloudflared tunnel
2. 启动 aiHub 巡检 Team（Leader Sonnet + 4 Soldiers）
3. 继续 Phase 2-3 知识体系（知识图谱化 / dream 去重）

## 关联资源

- Repo: https://github.com/vickioo/aiHub (private)
- Skill: `.claude/skills/aihub/`
- Memory: `project_aihub_knowledge.md`, `project_aihub_gateway_v3.md`, `project_aihub_team_architecture.md`
- 数据主权：`feedback_aihub_data_sovereignty.md`（aiHub 私有、个人数据只留家庭设备）

## 决策日志

- 2026-04-24: 进 progress hub 登记
- 2026-04-20: 巡检 Team 架构定案（Leader + 4 Soldiers 双层）
