# 使用示例

## 示例 1: 基础安装

```bash
# 默认安装到 ~/.openclaw
curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/install.sh | bash
```

## 示例 2: 自定义安装目录

```bash
# 安装到 /opt/openclaw
INSTALL_DIR=/opt/openclaw curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/install.sh | bash
```

## 示例 3: 使用环境变量配置

创建 `.env` 文件：

```bash
cat > ~/.openclaw/.env << EOF
OPENAI_API_KEY=sk-your-key
GITHUB_TOKEN=ghp-your-token
ANTHROPIC_API_KEY=sk-ant-your-key
EOF
```

## 示例 4: 批量部署到多台服务器

```bash
#!/bin/bash
# deploy.sh - 批量部署脚本

SERVERS=(
    "user@server1.example.com"
    "user@server2.example.com"
    "user@server3.example.com"
)

for server in "${SERVERS[@]}"; do
    echo "Deploying to $server..."
    ssh "$server" 'curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/install.sh | bash'
done
```

## 示例 5: Docker 容器中使用

```dockerfile
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl git python3

RUN curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/install.sh | bash

ENV OPENCLAW_HOME=/root/.openclaw
ENV PATH=$OPENCLAW_HOME/bin:$PATH

CMD ["/bin/bash"]
```

## 示例 6: 配置代理

```bash
# 在 config.env 中配置
HTTP_PROXY=http://127.0.0.1:7890
HTTPS_PROXY=http://127.0.0.1:7890
NO_PROXY=localhost,127.0.0.1
```

## 示例 7: 仅安装特定 Skills

修改 `install.sh` 中的 `install_skills()` 函数：

```bash
install_skills() {
    # 只安装 clawsec
    git clone https://github.com/pgf999/clawsec.git "$SKILLS_DIR/clawsec"
}
```

## 示例 8: CI/CD 集成

### GitHub Actions

```yaml
name: Deploy OpenClaw

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Install OpenClaw
        run: |
          curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/install.sh | bash
          
      - name: Configure
        env:
          OPENAI_KEY: ${{ secrets.OPENAI_API_KEY }}
        run: |
          echo "OPENAI_API_KEY=$OPENAI_KEY" >> ~/.openclaw/config.env
```

### GitLab CI

```yaml
deploy:
  script:
    - curl -fsSL https://raw.githubusercontent.com/pgf999/openclaw-installer/master/install.sh | bash
    - echo "OPENAI_API_KEY=$OPENAI_API_KEY" >> ~/.openclaw/config.env
```

## 示例 9: 自动更新脚本

```bash
#!/bin/bash
# auto-update.sh - 定期自动更新

cd ~/.openclaw
git pull

# 更新所有 skills
for skill in workspace/skills/*; do
    if [ -d "$skill/.git" ]; then
        cd "$skill" && git pull
    fi
done
```

添加到 crontab：

```bash
# 每天凌晨 2 点自动更新
0 2 * * * /path/to/auto-update.sh
```

## 示例 10: 健康检查脚本

```bash
#!/bin/bash
# health-check.sh

OPENCLAW_HOME=~/.openclaw

# 检查安装
if [ ! -d "$OPENCLAW_HOME" ]; then
    echo "❌ OpenClaw not installed"
    exit 1
fi

# 检查配置
if [ ! -f "$OPENCLAW_HOME/config.env" ]; then
    echo "⚠️  Config file missing"
fi

# 检查 skills
skill_count=$(ls -1 "$OPENCLAW_HOME/workspace/skills" | wc -l)
echo "✓ Found $skill_count skills"

echo "✅ Health check passed"
```
