---
title: 飞书 Wiki 分发
---

# 飞书 Wiki 分发

**Status**: ⚪ paused（已搁置，路线切换到 GitHub Pages）
**Last Updated**: 2026-04-24 23:10
**Last Session**: wiki-repair

## 目标

原计划把 CC 产出的报告/知识分发到飞书 Wiki 知识库；已改道 **GitHub Pages + cc-progress mirror** 方案（本 progress hub 即此路线产物）。

## 当前阶段

已搁置。Wiki 迁移在 "无 delete node 接口 + 源 docx ACL 无 move 权限" 双阻塞下叫停，保留为知识备份。

## 已完成（最近 5 项）

- ✅ 9 份 docx 已挂进 wiki 空间（APP_ID_2 bot，`/tmp/wiki-ingest-result-v2.json`，全部 node_token 落地）
- ✅ 两个 bot 身份厘清：APP_ID_1 缺 wiki scope，APP_ID_2 wiki 齐但无源文档 move 权限
- ✅ 飞书 Wiki v2 API 能力确认：**无 delete node 接口**（UI 删除 or drive:drive scope 删底层 docx 二选一）
- ✅ `feishu-docx` skill 保留作为"单文档临时分享"工具
- ✅ 路线切换：走 GitHub Pages (`vickioo/cc-progress`) 取代 wiki 分发

## 进行中 / Active Team

**Updated**: 2026-04-24 23:10

| 角色 | 执行者 | 当前任务 | 分支/PID | 状态 |
|------|--------|---------|---------|------|
| — | — | 无人派工 | — | 搁置 |

**Pending handoff files**（留档，搁置不跟进）:
- `/tmp/wiki-repair-result.json` — 完整阻塞根因 + 三方案建议
- `/tmp/wiki-ingest-result-v2.json` — 9 份 docx 已挂入 wiki 空间
- `/tmp/wiki-probe-scope.json` / `/tmp/wiki-probe-delete.json` — delete API 404 证据
- `/tmp/wiki-move-one-result.json` — move_docs_to_wiki 131006 permission denied 证据

**Next actions**（若日后重启此项目）:
1. 方案 A（推荐）：UI 把 9 份源 docx 所有权转给 APP_ID_2（或授 full_access），重跑 v2 脚本一键迁入
2. 方案 B：UI 人工删 9 个空壳节点 + 挂源 docx（最可控）
3. 方案 C：给 APP_ID_2 申请 drive:drive scope 删底层空壳后重配权限

## 阻塞项（已搁置不再跟进）

- 飞书 Wiki v2 open API 无 delete node 接口
- APP_ID_2 对源 docx 缺 move 权限（131006，文档级 ACL 非 OAuth scope）
- 路线已改，此项不再阻塞主线

## 关联资源

- Skill: `.claude/skills/feishu-docx/` (保留)
- Mirror repo: https://github.com/vickioo/cc-progress (新路线，取代)
- Memory: `reference_nanaclaw_permissions.md`

## 决策日志

- 2026-04-24: 搁置，改走 GitHub Pages 方案
- 2026-04-24: Wiki repair 阻塞在 delete API 不存在 + 文档 ACL；9 份 docx 已挂入但空壳节点未清
