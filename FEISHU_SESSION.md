---
title: 飞书 Session 2M 优化
---

# 飞书 Session 2M 优化

**Status**: 🟡 blocked
**Last Updated**: 2026-04-24
**Last Session**: -

## 目标

飞书 SDK 会话文件膨胀到 2M 时，对话响应变慢、断裂。需要压缩/分段而非删除（删会导致飞书对话链路断开）。

## 当前阶段

P1 待实施。方案已讨论，未排期。

## 已完成

- 根因定位：SDK 会话文件不能删只能压缩/新建
- 踩坑经验已入 MEMORY（`feedback_mycc_session.md`）

## 进行中

- 无（排期未定）

## 阻塞项

- 需 vicki 确认优先级：RAYLINE、aiHub gateway 收口 之后才轮得到
- 需确认压缩策略：是按 token 截断保留最近 N 轮，还是做摘要 summary chain

## 下一步

1. 待 RAYLINE / aiHub 收口后排期
2. 选定方案（截断 vs summary chain）
3. 在 `.claude/skills/mycc/scripts/src/channels/feishu.ts` / `feishu-streaming.ts` 实施

## 关联资源

- 改动点：`.claude/skills/mycc/scripts/src/channels/feishu.ts`, `feishu-streaming.ts`
- Memory: `feedback_mycc_session.md`

## 决策日志

- 2026-04-24: 进 progress hub 登记，暂未排期
