#!/bin/bash

# Claude Code UI 状態確認スクリプト

echo "📊 Claude Code UI 状態確認"
echo "=========================="

if pm2 list | grep -q "claude-ui.*online"; then
    echo "✅ 状態: 起動中"
    echo ""
    echo "📍 アクセスURL:"
    echo "  • ローカル: http://localhost:3009"
    
    # IPアドレスを取得して表示
    IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -1)
    if [ ! -z "$IP" ]; then
        echo "  • ネットワーク: http://$IP:3009"
    fi
    
    echo ""
    echo "📈 プロセス情報:"
    pm2 info claude-ui | grep -E "(status|uptime|restarts|CPU|memory)"
    
elif pm2 list | grep -q "claude-ui.*stopped"; then
    echo "⏸️  状態: 停止中"
    echo ""
    echo "起動するには: start-claude-ui.sh"
else
    echo "❌ 状態: 未インストール"
    echo ""
    echo "起動するには: start-claude-ui.sh"
fi

echo ""
echo "💡 利用可能なコマンド:"
echo "  • 起動: start-claude-ui.sh"
echo "  • 停止: stop-claude-ui.sh"
echo "  • ログ: pm2 logs claude-ui"
echo "  • モニター: pm2 monit"