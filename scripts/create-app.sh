#!/bin/bash

echo "🎯 Claude Code UI macOSアプリ作成ガイド"
echo "===================================="
echo ""
echo "以下の手順でAutomatorアプリを作成してください："
echo ""
echo "1. Automatorを開く (Spotlight検索で「Automator」)"
echo ""
echo "2. 「新規書類」→「アプリケーション」を選択"
echo ""
echo "3. 左側から「シェルスクリプトを実行」をドラッグ"
echo ""
echo "4. 以下のスクリプトをコピー＆ペースト:"
echo ""
echo "【起動用アプリのスクリプト】"
echo "----------------------------------------"
cat << 'EOF'
#!/bin/bash
/Users/miya/projects/claudecodeui/scripts/start-claude-ui.sh

# 3秒後に自動的にブラウザを開く
sleep 3
if pm2 list | grep -q "claude-ui.*online"; then
    open http://localhost:3009
fi
EOF
echo "----------------------------------------"
echo ""
echo "5. 保存: ⌘+S"
echo "   名前: ClaudeUI"
echo "   場所: アプリケーション"
echo ""
echo "6. 同様に停止用アプリも作成:"
echo "   名前: ClaudeUI-Stop"
echo "   スクリプト: /Users/miya/projects/claudecodeui/scripts/stop-claude-ui.sh"
echo ""
echo "💡 オプション: アイコンの変更"
echo "  1. アプリを右クリック →「情報を見る」"
echo "  2. 左上のアイコンをクリック"
echo "  3. 新しいアイコン画像をペースト"
echo ""
echo "完了したら、Dockにドラッグ＆ドロップして使用できます！"