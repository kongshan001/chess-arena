# Pixi.js 客户端框架

## 项目结构
```
src/client/pixi/
├── index.html          # 入口HTML
├── src/
│   ├── index.ts        # 主入口
│   ├── Game.ts         # 游戏主类
│   ├── Board.ts        # 棋盘渲染
│   ├── Piece.ts        # 棋子渲染
│   ├── Battle.ts       # 战斗场景
│   └── UI/             # UI组件
├── package.json
└── vite.config.ts
```

## 核心模块

### 1. Game.ts - 游戏主类
- 初始化Pixi应用
- 场景管理（菜单、战斗、结算）
- 资源加载

### 2. Board.ts - 棋盘渲染
- 8x8棋盘网格
- 格子高亮效果
- 棋子放置检测
- 拖拽交互

### 3. Piece.ts - 棋子渲染
- 棋子精灵渲染
- 动画状态机
- 特效层
- 羁绊光效

### 4. Battle.ts - 战斗场景
- 战斗流程控制
- 技能动画播放
- 伤害数字显示
- 胜负判定

## 技术栈
- Pixi.js 8.x
- TypeScript
- Vite

---
更新日期：2026-04-17
