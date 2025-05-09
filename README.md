# Try MCP Server
- AWS MCP Serverを題材に、MCP Serverを試すにあたっての最低限必要なツール、知識をまとめたリポジトリ

## 稼働環境

| Name                          | Version  | Description                                             |
| ----------------------------- | -------- | ------------------------------------------------------- |
| VS Code                       | 1.99以上 | GitHub Copilotエージェントをサポートしている必要がある  |
| GitHub Copilotライセンス      | -        | GitHub Copilotエージェントを使用                        |
| Docker Desktop                | -        | 使用するツールがインストール済みの Dev Container を利用 |
| AWS CLI                       | -        |                                                         |
| [任意] Amazon Q Developer CLI | latest   |                                                         |
| [任意] AWSアカウント          | -        | 自分の好きに触れる環境があればそれを使います            |

- Docker環境を使わない場合

| Name                       | Version | Description              |
| -------------------------- | ------- | ------------------------ |
| uv                         | -       | uvx経由でMCPサーバを起動 |
| npm                        | -       | npx経由でMCPサーバを起動 |
| VSCode拡張: GitHub Copilot | latest  |                          |
| VSCode拡張: Copilot Chat   | latest  |                          |

## コンテンツ
- [AWS MCP Serverを使ってみる](./docs/try_aws_mcp_servers.md)