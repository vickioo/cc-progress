---
title: RAYLINE Theme 攻坚
---

# RAYLINE Theme 攻坚

**Status**: 🟢 active
**Last Updated**: 2026-04-24
**Last Session**: ws0 handoff

## 目标

统一 RAYLINE 前端主题系统：ThemeContext + themeBootstrap + 多入口注入（main / pm-main / terminal-main），消除样式分裂。

## 当前阶段

WS-0 实现已完成，但 acceptance lint 阻塞未 push。

## 已完成

- ThemeContext.jsx / themeBootstrap.js 主干落地
- 三个入口注入：main.jsx / pm-main.jsx / terminal-main.jsx
- index.css 主题变量统一
- Settings.jsx 接入切换
- 仅动过的 7 个文件 eslint 通过

## 进行中

- 分支：待确认（handoff 未写明）
- Handoff：`/tmp/handoff-ws0.json`
- 状态：`ok:false`、`build:pass`、`lint:fail`、`pushed:false`

## 阻塞项

- 仓库级 `npm run lint` 在一批 **pre-existing 非本次改动** 文件上报错
  - chat.jsx / App.jsx / BranchSelector.jsx / ChatArea.jsx / DispatchCard.jsx / GitStatusPill.jsx / InteractiveBlock.jsx / MermaidBlock.jsx / multicaModels.jsx / useAgent.js / pm-components 等
- `package-lock.json` 在运行前已 dirty（非 WS-0 引入）
- **决策输入需要 vicki**：是否放行"只要 touched-file 通过就 push"，还是先修历史 lint

## 下一步

1. vicki 决策：放行策略 / 修历史 lint（预估一批 react-hooks 规则违例）
2. 决策后派工给 Codex：修 lint → commit → push → 开 PR
3. 主题切换 e2e 验证（Settings 页面切主题 → 三个入口实际生效）

## 关联资源

- Repo: https://github.com/vickioo/RAYLINE (public)
- Handoff: `/tmp/handoff-ws0.json`
- Touched files: ThemeContext.jsx, themeBootstrap.js, main.jsx, pm-main.jsx, terminal-main.jsx, index.css, Settings.jsx

## 决策日志

- 2026-04-24: WS-0 实现完成，lint 级 acceptance 失败，等 vicki 决策放行策略
