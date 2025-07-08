#!/bin/bash

# パスを設定
export PATH="/opt/homebrew/bin:$PATH"

# Claude Code UI 起動スクリプト
# 現在時刻を記録
CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S %Z")

cd /Users/miya/projects/claudecodeui

# すでに起動しているかチェック
if /opt/homebrew/bin/pm2 list | /usr/bin/grep -q "claude-ui.*online"; then
    echo "⚠️  Claude Code UIはすでに起動しています"
    echo "📍 URL: http://localhost:3009"
    # IPアドレスを取得して表示
    IP=$(/sbin/ifconfig | /usr/bin/grep "inet " | /usr/bin/grep -v 127.0.0.1 | /usr/bin/awk '{print $2}' | /usr/bin/head -1)
    if [ ! -z "$IP" ]; then
        echo "📱 iPhone/iPad用: http://$IP:3009"
    fi
else
    echo "🚀 Claude Code UIを起動しています..."
    /opt/homebrew/bin/pm2 start ecosystem.config.js
    
    # 起動を待つ
    sleep 3
    
    if /opt/homebrew/bin/pm2 list | /usr/bin/grep -q "claude-ui.*online"; then
        echo "✅ Claude Code UIが正常に起動しました！"
        echo "🕐 起動時刻: $CURRENT_TIME"
        echo "📍 URL: http://localhost:3009"
        
        # 起動時刻をログファイルに記録
        echo "$CURRENT_TIME - Claude Code UI started" >> /Users/miya/projects/claudecodeui/logs/startup.log
        
        # IPアドレスを取得して表示
        IP=$(/sbin/ifconfig | /usr/bin/grep "inet " | /usr/bin/grep -v 127.0.0.1 | /usr/bin/awk '{print $2}' | /usr/bin/head -1)
        if [ ! -z "$IP" ]; then
            echo "📱 iPhone/iPad用: http://$IP:3009"
        fi
        
        echo ""
        echo "💡 ヒント:"
        echo "  • 停止する場合: stop-claude-ui.sh"
        echo "  • 状態確認: status-claude-ui.sh"
        echo "  • ログ確認: /opt/homebrew/bin/pm2 logs claude-ui"
    else
        echo "❌ 起動に失敗しました"
        echo "ログを確認してください: /opt/homebrew/bin/pm2 logs claude-ui"
    fi
fi