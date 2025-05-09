# AWS MCP Serverを使ってみる

- [AWS MCP Server](https://awslabs.github.io/mcp/)を起動してCopilotのエージェントモードから使ってみます
- (任意)Amazon Q CLIからも使ってみます

## 1. VSCodeで起動

- このリポジトリを `git clone` します
- VSCodeで開き、Dev Containerで起動します。このDev Containerは以下がインストールされた状態で起動します
  - `AWS CLI` : AWS MCP Serverを使う際に実質的に必要になります
  - `uv` : AWS MCP Serverは `uvx` で起動するため必要となります
  - Docker in Docker (未使用)
    - 現状、Dockerレジストリ経由でのMCP Server起動は未サポート(自前で`docker build` してから `docker run` のみ)の様子
    - 将来的には、環境セットアップやセキュリティの観点でDocker経由の実行の方がよいと思われます
  - VSCode拡張
    - GitHub Copilot / Copilot Chat
    - 他

## 2. AWS認証情報の設定
- Dev Containerで実行した場合、以下のようになっています
  - ホスト側の認証情報をコンテナにマウントしています
  - デフォルトでは、`AWS_PROFILE=aws-mcp` になっています。必要に応じて変更してください

## 3. MCP Serverの起動
- `.vscode/mcp.json` にAWS MCP Serverの一部が設定されています
- `.vscode/mcp.json` を開き、各サーバの設定箇所の起動ボタンを押すと、MCP Serverが起動します
- 起動後、GitHub Copilotのチャットウィンドウのエージェントモードからツールまたはコンテキストに追加して利用できます

## 4. Copilotエージェントモードで使ってみる
- Copilot Chatのウィンドウ -> エージェントモードに切替 -> ツールを選択

## 参考
### `mcp.json` について
#### クレデンシャル情報の扱い方
- 対話的にプロンプトから入力
  ```json
  {
    "inputs": [
      {
        "type": "promptString",
        "id": "github_token",
        "description": "GitHub Personal Access Token",
        "password": true,
      },
    ],
    "servers": {
      ...
    }
  }
  ```

- envFileで読み込み
  ```json
  "servers": {
    "awslabs.core-mcp-server": {
      ...
      "envFile": "${workspaceFolder}/.env"
      ...
    }
  }
  ```

- ホスト側の環境変数から読み込み
  ```json
  "servers": {
    "awslabs.bedrock-kb-retrieval-mcp-server": {
      ...
      "env": {
        "AWS_PROFILE": "${env:AWS_PROFILE}",
      },
      ...
    }
  }
  ```

#### その他
- VSCodeでは `disabled`, `autoApprove` はサポートされていない
