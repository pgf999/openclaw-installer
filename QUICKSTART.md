# 快速开始指南

## 5 分钟快速部署 OpenClaw

### 步骤 1: 运行安装脚本

```bash
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/install.sh | bash
```

### 步骤 2: 配置 API Keys

```bash
nano ~/.openclaw/config.env
```

填入你的 API keys：

```bash
OPENAI_API_KEY=sk-xxx
GITHUB_TOKEN=ghp_xxx
```

### 步骤 3: 重新加载环境

```bash
source ~/.bashrc  # 或 source ~/.zshrc
```

### 步骤 4: 验证安装

```bash
# 检查安装目录
ls -la ~/.openclaw/

# 查看已安装的 skills
ls ~/.openclaw/workspace/skills/
```

## 常用命令

### 更新 OpenClaw

```bash
cd ~/.openclaw
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/update.sh | bash
```

### 卸载 OpenClaw

```bash
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/uninstall.sh | bash
```

### 添加新 Skill

```bash
cd ~/.openclaw/workspace/skills/
git clone https://github.com/your-org/your-skill.git
```

## 环境变量

安装后，以下环境变量会被设置：

- `OPENCLAW_HOME`: OpenClaw 安装目录
- `OPENCLAW_WORKSPACE`: Skills 工作目录
- `PATH`: 包含 OpenClaw bin 目录

## 目录说明

```
~/.openclaw/
├── config.env              # 主配置文件（包含 API keys）
├── workspace/
│   └── skills/
│       ├── clawsec/        # 安全扫描 skill
│       └── [其他 skills]
├── logs/                   # 日志目录
└── bin/                    # 可执行文件
```

## 下一步

- 查看 [完整文档](README.md)
- 浏览 [Skills 列表](skills/)
- 加入 [社区讨论](https://github.com/pgf999/openclaw-installer/discussions)
- 贡献你的 [Skill](CONTRIBUTING.md)

## 需要帮助？

- [常见问题](README.md#常见问题)
- [提交 Issue](https://github.com/pgf999/openclaw-installer/issues)
- [查看示例](examples/)
