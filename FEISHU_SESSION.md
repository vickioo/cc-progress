---
title: 飞书 Session 2M 优化
---

# 飞书 Session 2M 优化

**Status**: 🟡 blocked（设计完成，等实施排期）
**Last Updated**: 2026-04-24 23:10
**Last Session**: session-redesign diagnostic

## 目标

废除飞书通道当前"jsonl >2MB 硬切会话 + 本地 3 句话摘要"的粗暴行为，改用 SDK 原生 `/compact` + 新增 `/insights` + 软边界预警三档（1.2/1.8MB），保留 session_id 连续性。

## 当前阶段

P1 设计完成（`/tmp/feishu-session-redesign.md`），待实施。SDK 原生 compact 能力已验证可调用。

## 已完成（最近 5 项）

- ✅ 代码锚点完整定位：`.claude/skills/mycc/scripts/src/channels/feishu-commands.ts` L309/343/355/551/907/1003/1491 全有据
- ✅ SDK 原生 compact 可用性确认：`sdk.d.ts` L1327-1335 / L1723-1735 / L2285 / L2453（`compact_boundary` / `SDKStatus=compacting` / `SessionStart source=compact`）
- ✅ 三段方案 P1/P2/P3（1.5h + 2h + 1h）+ 风险清单
- ✅ Session 切换影响面诊断：L343-384 只改内存标记、不 kill 任何 child_process / 远端任务；回调通过 `feishuChannel` config 直送飞书，不依赖 sessionId
- ✅ 派工回收机制方案：`~/.mycc/pending-agents/*.json` + `/tmp/handoff-{uuid}.json` 双通道

## 进行中 / Active Team

**Updated**: 2026-04-24 23:10

| 角色 | 执行者 | 当前任务 | 分支/PID | 状态 |
|------|--------|---------|---------|------|
| Leader | Opus (参谋长) | 设计完成等排期 | - | 不下场 |
| Worker | — | — | — | 未派工（排期在 RAYLINE 收口之后） |

**Pending handoff files**（下次启动扫这些）:
- `/tmp/feishu-session-diag.json` — 完整代码锚点 + 三段 rollout + 风险
- `/tmp/feishu-session-redesign.md` — 伪代码级方案文档
- `/tmp/session-transfer-diagnostic.md` — session 切换影响面 / 派工回收建议

**Next actions**（任何人接手的第一步）:
1. vicki 定排期（RAYLINE push 解阻塞后）
2. P1 实施：feishu-commands.ts 加 `/compact` `/insights` case，`handleCompact` 转发 SDK 裸 `/compact`，监听 `compact_boundary` 事件
3. P2 实施：删 L343-384 自动切换块，三档阈值告警（1.2/1.6 MB warn，1.8 MB 硬决策卡），`_warned` 内存标记去重
4. P3：fixture jsonl @ 1.0/1.3/1.9 MB 回归，断言 session_id 在 `/compact` 后不变
5. 派工回收（可拆独立任务）：`~/.mycc/pending-agents/*.json` 登记 + 新 session 入口扫目录 + `[handoff]` 前缀注入

## 阻塞项

- 需 vicki 确认优先级：排在 RAYLINE 推进完、aiHub 收口之后
- 风险项：adapter 是否透传裸 `/compact` 到 CLI；compact 网络失败回滚逻辑需实测
- 飞书 card v2 按钮 callback 在 `feishu-menu-router.ts` 的稳定性需回归

## 关联资源

- 改动点：`.claude/skills/mycc/scripts/src/channels/feishu-commands.ts`（主），`feishu-streaming.ts`，`feishu-menu-router.ts`
- SDK 参考：`node_modules/@anthropic-ai/claude-agent-sdk/sdk.d.ts`
- Memory: `feedback_mycc_session.md`

## 决策日志

- 2026-04-24: P1 设计完成，诊断报告落地；实施排在 RAYLINE 之后
- 2026-04-24 早些: session 切换影响面诊断——结论：不 kill 任何进程，回调仍可达；但跨 turn 语义引用会断（需派工回收机制）
