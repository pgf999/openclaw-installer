# OpenClaw Installer 🚀

一键部署 OpenClaw 到 Linux 和 macOS，预装常用 skills 和工具。

## 特性

- ✅ 一键安装，零配置启动
- 🔧 预装生产环境常用 skills（clawsec 等）
- 🔐 安全的 API key 管理
- 🐧 支持 Linux 和 macOS
- 📦 自动依赖检查和安装
- 🤝 社区驱动，欢迎贡献

## 快速开始

### 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/main/install.sh | bash
```

或者手动安装：

```bash
git clone https://github.com/pgf999/openclaw-installer.git
cd openclaw-installer
chmod +x install.sh
./install.sh
```

### 配置

安装完成后，编辑配置文件：

```bash
nano ~/.openclaw/config.env
```

添加你的 API keys：

```bash
# API Keys
OPENAI_API_KEY=your_openai_key_here
ANTHROPIC_API_KEY=your_anthropic_key_here
GITHUB_TOKEN=your_github_token_here

# OpenClaw Settings
OPENCLAW_WORKSPACE=$HOME/.openclaw/workspace
OPENCLAW_LOG_LEVEL=info
```

重新加载 shell：

```bash
source ~/.bashrc  # 或 source ~/.zshrc
```

## 预装 Skills

- **clawsec** - 安全扫描和漏洞检测
- 更多 skills 持续添加中...

## 自定义安装

### 指定安装目录

```bash
INSTALL_DIR=/opt/openclaw ./install.sh
```

### 指定版本

```bash
OPENCLAW_VERSION=v1.0.0 ./install.sh
```

## 目录结构

```
~/.openclaw/
├── config.env          # 配置文件
├── workspace/
│   └── skills/
│       ├── clawsec/    # 安全 skill
│       └── ...         # 其他 skills
└── bin/                # 可执行文件
```

## 贡献指南

欢迎贡献新的 skills、改进安装脚本或文档！

### 添加新 Skill

1. Fork 本仓库
2. 在 `skills/` 目录添加你的 skill
3. 更新 `install.sh` 中的 `install_skills()` 函数
4. 更新 README.md
5. 提交 Pull Request

### 开发

```bash
# 克隆仓库
git clone https://github.com/pgf999/openclaw-installer.git
cd openclaw-installer

# 测试安装脚本
./install.sh

# 提交更改
git add .
git commit -m "feat: add new skill"
git push origin main
```

## 常见问题

### Q: 如何更新 OpenClaw？

```bash
cd ~/.openclaw
git pull
```

### Q: 如何卸载？

```bash
rm -rf ~/.openclaw
# 手动从 ~/.bashrc 或 ~/.zshrc 中删除 OpenClaw 相关配置
```

### Q: 支持 Windows 吗？

目前仅支持 Linux 和 macOS。Windows 支持计划中（WSL2 可用）。

### Q: 如何添加自定义 skill？

将 skill 克隆到 `~/.openclaw/workspace/skills/` 目录即可。

## 安全性

- API keys 存储在本地 `config.env` 文件中
- 建议设置文件权限：`chmod 600 ~/.openclaw/config.env`
- 不要将包含真实 API keys 的配置文件提交到 Git

## 许可证

MIT License

## 社区

- 问题反馈：[GitHub Issues](https://github.com/pgf999/openclaw-installer/issues)
- 讨论：[GitHub Discussions](https://github.com/pgf999/openclaw-installer/discussions)
- 贡献：欢迎提交 Pull Request

## 致谢

感谢所有贡献者让 OpenClaw 安装变得更简单！

---

Made with ❤️ by the OpenClaw Community
