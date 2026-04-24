---
title: CC Progress Hub
---

# CC Progress Hub

> 跨会话的项目进度档案。会话断线/切换后，从这里捡起来继续干。

**Last Updated**: 2026-04-24

## 主线项目一览

| 项目 | 状态 | 负责阶段 | 链接 |
|------|------|---------|------|
| RAYLINE Theme 攻坚 | 🟢 active | WS-0 theme 统一（lint 阻塞中） | [RAYLINE_THEME](./RAYLINE_THEME.md) |
| 飞书 Session 2M 优化 | 🟡 blocked | P1 待实施 | [FEISHU_SESSION](./FEISHU_SESSION.md) |
| 飞书 Wiki 分发 | ⚪ paused | 已搁置，vicki 不走知识库路线 | [WIKI_DISTRIBUTION](./WIKI_DISTRIBUTION.md) |
| aiHub 知识 & Gateway | 🟢 active | Phase 0+1 完成，Gateway v3 待绑域名 | [AIHUB](./AIHUB.md) |
| mycc 基础设施 | 🟢 active | 飞书 session 转移修复 / progress hub 启动 | [MYCC_INFRA](./MYCC_INFRA.md) |

## 约定

- 所有页面结构见 [`_TEMPLATE.md`](./_TEMPLATE.md)
- 决策日志 **append-only 反向时间**（新在上）
- 进行中项写清 **分支 / PID / 负责 agent**
- 不写编造数据，不提交凭据/open_id

## 同步机制

- 写入：本仓 `git push`（独立于主项目仓）
- 读取：会话启动时 CC 读 INDEX.md，按需展开
- 自动化：见 [`update-progress.sh`](./update-progress.sh)（WIP，当前半手动）
