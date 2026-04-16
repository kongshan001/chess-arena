#!/bin/bash
# 项目工作状态监控系统
# 每30分钟检查各岗位工作状态

PROJECT_DIR="/root/.openclaw/workspace/chess-auto-battle"
LOG_DIR="$PROJECT_DIR/team/.checkpoints"
CURRENT_TIME=$(date "+%Y-%m-%d %H:%M")

mkdir -p "$LOG_DIR"

# 检查各岗位状态
check_role_status() {
    local role=$1
    local last_update=$(find "$PROJECT_DIR/team/$role/工作记录" -name "*.md" -type f -exec ls -lt {} \; 2>/dev/null | head -1 | awk '{print $6,$7,$8}')
    
    if [ -z "$last_update" ]; then
        echo "⚠️ $role: 尚未开始工作"
        return 1
    else
        echo "✅ $role: 工作正常"
        return 0
    fi
}

echo "========================================="
echo " Chess Arena 项目工作状态检查"
echo " 检查时间: $CURRENT_TIME"
echo "========================================="

echo ""
echo "📋 各岗位状态:"
echo "-----------------------------------------"

roles=("策划" "美术" "交互设计" "前端" "后端" "QA" "PM")
active_count=0

for role in "${roles[@]}"; do
    if check_role_status "$role"; then
        ((active_count++))
    fi
done

echo ""
echo "-----------------------------------------"
echo "📊 统计: $active_count/7 岗位在线"

# 记录检查点
echo "$CURRENT_TIME - $active_count/7 岗位在线" >> "$LOG_DIR/daily.log"

# 检查是否有岗位超过2小时无记录
echo ""
echo "⚠️ 需关注:"
find "$PROJECT_DIR/team" -name "*.md" -type f -mmin +120 2>/dev/null | while read file; do
    echo "  - $(basename $(dirname $file)) 已超过2小时无更新"
done

echo ""
echo "✅ 检查完成"