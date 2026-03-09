# Contributing to OpenClaw Installer | 贡献指南

[English](#english) | [中文](#中文)

---

## English

Thank you for considering contributing to OpenClaw Installer!

### How to Contribute

#### Reporting Bugs

When submitting a bug report on [GitHub Issues](https://github.com/pgf999/openclaw-installer/issues), please include:

- Operating system and version
- Error messages and logs
- Steps to reproduce
- Expected behavior

#### Submitting New Features

1. Discuss your idea in Issues first
2. Fork the repository
3. Create a feature branch: `git checkout -b feature/amazing-feature`
4. Commit your changes: `git commit -m 'feat: add amazing feature'`
5. Push the branch: `git push origin feature/amazing-feature`
6. Submit a Pull Request

### Adding a New Skill

Create a new skill directory in `skills/` with:

```
skills/your-skill/
├── README.md           # Skill documentation
├── install.sh          # Installation script (optional)
├── config.yaml         # Configuration file
└── src/                # Source code
```

Update the `install_skills()` function in `install.sh`.

### Code Standards

- Use `shellcheck` for shell scripts
- Keep code clean and readable
- Add necessary comments
- Follow existing code style

### Commit Convention

Use semantic commit messages:

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation update
- `style:` Code formatting
- `refactor:` Refactoring
- `test:` Testing
- `chore:` Build/tools

### Pull Request Process

1. Ensure code passes all tests
2. Update relevant documentation
3. Clearly describe changes in PR
4. Wait for review and feedback
5. Make changes based on feedback

### Development Environment

```bash
# Clone repository
git clone https://github.com/pgf999/openclaw-installer.git
cd openclaw-installer

# Test installation script
./install.sh

# Run tests (if available)
./test.sh
```

### Community Guidelines

- Respect all contributors
- Be friendly and professional
- Welcome newcomers' questions
- Help others grow

### License

Contributed code will be licensed under MIT License.

Thank you for your contribution! 🎉

---

## 中文

感谢你考虑为 OpenClaw Installer 做贡献！

### 如何贡献

#### 报告 Bug

在 [GitHub Issues](https://github.com/pgf999/openclaw-installer/issues) 提交 bug 报告时，请包含：

- 操作系统和版本
- 错误信息和日志
- 复现步骤
- 预期行为

#### 提交新功能

1. 先在 Issues 中讨论你的想法
2. Fork 仓库
3. 创建功能分支：`git checkout -b feature/amazing-feature`
4. 提交更改：`git commit -m 'feat: add amazing feature'`
5. 推送分支：`git push origin feature/amazing-feature`
6. 提交 Pull Request

### 添加新 Skill

在 `skills/` 目录创建新的 skill 目录，包含：

```
skills/your-skill/
├── README.md           # Skill 说明
├── install.sh          # 安装脚本（可选）
├── config.yaml         # 配置文件
└── src/                # 源代码
```

更新 `install.sh` 中的 `install_skills()` 函数。

### 代码规范

- Shell 脚本使用 `shellcheck` 检查
- 保持代码简洁易读
- 添加必要的注释
- 遵循现有代码风格

### Commit 规范

使用语义化提交信息：

- `feat:` 新功能
- `fix:` Bug 修复
- `docs:` 文档更新
- `style:` 代码格式
- `refactor:` 重构
- `test:` 测试
- `chore:` 构建/工具

### Pull Request 流程

1. 确保代码通过所有测试
2. 更新相关文档
3. 在 PR 中清楚描述更改
4. 等待 review 和反馈
5. 根据反馈进行修改

### 开发环境

```bash
# 克隆仓库
git clone https://github.com/pgf999/openclaw-installer.git
cd openclaw-installer

# 测试安装脚本
./install.sh

# 运行测试（如果有）
./test.sh
```

### 社区准则

- 尊重所有贡献者
- 保持友好和专业
- 欢迎新手提问
- 帮助他人成长

### 许可证

贡献的代码将采用 MIT 许可证。

感谢你的贡献！🎉
