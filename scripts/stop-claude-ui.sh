#!/bin/bash

# パスを設定
export PATH="/opt/homebrew/bin:$PATH"

# Claude Code UI 停止スクリプト
# 現在時刻を記録
CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S %Z")

if /opt/homebrew/bin/pm2 list | /usr/bin/grep -q "claude-ui"; then
    echo "🛑 Claude Code UIを停止しています..."
    /opt/homebrew/bin/pm2 stop claude-ui
    /opt/homebrew/bin/pm2 delete claude-ui
    echo "✅ Claude Code UIが停止しました"
    echo "🕐 停止時刻: $CURRENT_TIME"
    
    # 停止時刻をログファイルに記録
    echo "$CURRENT_TIME - Claude Code UI stopped" >> /Users/miya/projects/claudecodeui/logs/startup.log
else
    echo "⚠️  Claude Code UIは起動していません"
fi