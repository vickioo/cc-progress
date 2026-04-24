---
title: mycc 基础设施
---

# mycc 基础设施

**Status**: 🟢 active
**Last Updated**: 2026-04-24
**Last Session**: current

## 目标

mycc（Claude Code 跨设备小程序后端）基础设施建设：会话通道、HTTP server、飞书/微信桥接、进度档案。

## 当前阶段

- 本次会话：搭 progress hub（docs/progress/ + GitHub Pages）
- 正在修：approval-bridge HMAC 协议同步（已 commit `4d53903`）
- 飞书通道：streaming / 分段持续打磨

## 已完成

- approval-bridge HMAC token 协议同步上游（commit `4d53903`）
- usage-report v1.3.1：B 卡回滚 grouped-bar、A 卡保留 line-chart（`1cc98e3`）
- usage-report v1.3.0：dogfood lib/builders（`40dab3c`）
- mycc scripts/src 飞书 streaming / http-server / index 多项打磨（未 commit，working tree）
- morning-report.js → morning-report.cjs 重命名
- 本次：progress hub 文档基础设施搭建

## 进行中

- 分支：`agent/b5-feishu-docx`
- Working tree 大批 modified 文件（mycc scripts、usage-report、skills README、ecosystem.config 等）
- 本任务：progress infrastructure 建设

## 阻塞项

- 无（本任务独立于主业务）

## 下一步

1. progress hub push + Pages 启用
2. 写 `update-progress.sh` 半自动脚本
3. 把 working tree 的 modified 文件整理成几个合理的 commit（另派任务）

## 关联资源

- Repo: https://github.com/vickioo/mycc (private)
- Progress Repo: https://github.com/vickioo/cc-progress (public, 本次新建)
- Branch: `agent/b5-feishu-docx`
- 最近 commits: `4d53903`, `1cc98e3`, `40dab3c`, `c2ff49f`, `b490fd4`

## 决策日志

- 2026-04-24: 启动 progress hub，选 public 独立 repo `vickioo/cc-progress` 做 Pages host（mycc 本身 private）
