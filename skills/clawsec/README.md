# ClawSec - Security Skill for OpenClaw

安全扫描和漏洞检测 skill。

## 功能

- 代码安全扫描
- 依赖漏洞检测
- 配置安全审计
- 最佳实践建议

## 安装

通过 OpenClaw Installer 自动安装，或手动：

```bash
git clone https://github.com/pgf999/clawsec.git ~/.openclaw/workspace/skills/clawsec
```

## 使用

```bash
# 扫描当前目录
clawsec scan .

# 扫描特定文件
clawsec scan /path/to/file

# 生成报告
clawsec report
```

## 配置

在 `~/.openclaw/config.env` 中配置：

```bash
CLAWSEC_ENABLED=true
CLAWSEC_AUTO_SCAN=false
```

## 贡献

欢迎贡献！请查看主仓库的 [CONTRIBUTING.md](../../CONTRIBUTING.md)。
