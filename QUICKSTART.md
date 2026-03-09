# Quick Start Guide | 快速开始指南

[English](#english) | [中文](#中文)

---

## English

### Deploy OpenClaw in 5 Minutes

#### Step 1: Run Installation Script

```bash
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/install.sh | bash
```

#### Step 2: Configure API Keys

```bash
nano ~/.openclaw/config.env
```

Fill in your API keys:

```bash
OPENAI_API_KEY=sk-xxx
GITHUB_TOKEN=ghp_xxx
```

#### Step 3: Reload Environment

```bash
source ~/.bashrc  # or source ~/.zshrc
```

#### Step 4: Verify Installation

```bash
# Check installation directory
ls -la ~/.openclaw/

# View installed skills
ls ~/.openclaw/workspace/skills/
```

### Common Commands

#### Update OpenClaw

```bash
cd ~/.openclaw
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/update.sh | bash
```

#### Uninstall OpenClaw

```bash
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/uninstall.sh | bash
```

#### Add New Skill

```bash
cd ~/.openclaw/workspace/skills/
git clone https://github.com/your-org/your-skill.git
```

### Environment Variables

After installation, these environment variables are set:

- `OPENCLAW_HOME`: OpenClaw installation directory
- `OPENCLAW_WORKSPACE`: Skills workspace directory
- `PATH`: Includes OpenClaw bin directory

### Directory Structure

```
~/.openclaw/
├── config.env              # Main configuration (contains API keys)
├── workspace/
│   └── skills/
│       ├── clawsec/        # Security scanning skill
│       └── [other skills]
├── logs/                   # Log directory
└── bin/                    # Executables
```

### Next Steps

- View [Full Documentation](README.md)
- Browse [Skills List](skills/)
- Join [Community Discussion](https://github.com/pgf999/openclaw-installer/discussions)
- Contribute your [Skill](CONTRIBUTING.md)

### Need Help?

- [FAQ](README.md#faq)
- [Submit Issue](https://github.com/pgf999/openclaw-installer/issues)
- [View Examples](examples/)

---

## 中文

### 5 分钟快速部署 OpenClaw

#### 步骤 1: 运行安装脚本

```bash
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/install.sh | bash
```

#### 步骤 2: 配置 API Keys

```bash
nano ~/.openclaw/config.env
```

填入你的 API keys：

```bash
OPENAI_API_KEY=sk-xxx
GITHUB_TOKEN=ghp_xxx
```

#### 步骤 3: 重新加载环境

```bash
source ~/.bashrc  # 或 source ~/.zshrc
```

#### 步骤 4: 验证安装

```bash
# 检查安装目录
ls -la ~/.openclaw/

# 查看已安装的 skills
ls ~/.openclaw/workspace/skills/
```

### 常用命令

#### 更新 OpenClaw

```bash
cd ~/.openclaw
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/update.sh | bash
```

#### 卸载 OpenClaw

```bash
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/uninstall.sh | bash
```

#### 添加新 Skill

```bash
cd ~/.openclaw/workspace/skills/
git clone https://github.com/your-org/your-skill.git
```

### 环境变量

安装后，以下环境变量会被设置：

- `OPENCLAW_HOME`: OpenClaw 安装目录
- `OPENCLAW_WORKSPACE`: Skills 工作目录
- `PATH`: 包含 OpenClaw bin 目录

### 目录说明

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

### 下一步

- 查看 [完整文档](README.md)
- 浏览 [Skills 列表](skills/)
- 加入 [社区讨论](https://github.com/pgf999/openclaw-installer/discussions)
- 贡献你的 [Skill](CONTRIBUTING.md)

### 需要帮助？

- [常见问题](README.md#常见问题)
- [提交 Issue](https://github.com/pgf999/openclaw-installer/issues)
- [查看示例](examples/)
