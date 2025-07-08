#!/bin/bash
# パスを設定
export PATH="/opt/homebrew/bin:$PATH"

# 再起動時刻を記録
echo "$(date '+%Y-%m-%d %H:%M:%S %Z') - Claude Code UI restarted" >> /Users/miya/projects/claudecodeui/logs/startup.log
/opt/homebrew/bin/pm2 restart claude-ui