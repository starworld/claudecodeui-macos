#!/bin/bash

# QRコード表示スクリプト（iPhone/iPadアクセス用）

echo "📱 Claude Code UI - iPhoneアクセス用QRコード"
echo "========================================="

# Claude UIが起動しているか確認
if ! pm2 list | grep -q "claude-ui.*online"; then
    echo "⚠️  Claude Code UIが起動していません"
    echo "先に start-claude-ui.sh を実行してください"
    exit 1
fi

# IPアドレスを取得
IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -1)

if [ -z "$IP" ]; then
    echo "❌ ネットワークIPアドレスが見つかりません"
    exit 1
fi

URL="http://$IP:3009"

# qrencodeがインストールされているか確認
if ! command -v qrencode &> /dev/null; then
    echo "📦 qrencodeをインストールしています..."
    brew install qrencode
fi

echo ""
echo "🔗 URL: $URL"
echo ""
echo "以下のQRコードをiPhoneでスキャンしてください:"
echo ""

# QRコードを生成して表示
qrencode -t UTF8 "$URL"

echo ""
echo "💡 ヒント:"
echo "  • iPhoneのカメラアプリでQRコードをスキャン"
echo "  • SafariでClaude Code UIが開きます"
echo "  • ホーム画面に追加して、アプリのように使えます"
echo ""
echo "⚠️  注意: MacとiPhoneが同じWi-Fiに接続されている必要があります"