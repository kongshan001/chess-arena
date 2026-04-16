# 美术岗位 - AI资产生成指南

## 对接 ArtPipe API

API 地址: https://github.com/kongshan001/art-pipe

### 本地启动

```bash
git clone https://github.com/kongshan001/art-pipe.git
cd art-pipe
python3 app.py
# API 运行在 http://localhost:8080
```

### 生成棋子资产

 Chess Arena 需要20个基础棋子，每个棋子需要以下提示词格式：

#### 战士类 (Warrior)
```
像素风战士，穿重甲，手持长剑，蓝色基调， idle/walk/attack/hurt/die 动画
风格: pixel, char_type: warrior, 颜色: 蓝色
```

#### 法师类 (Mage)
```
像素风法师，穿长袍，手持法杖，紫色基调，释放技能动画
风格: pixel char_type: mage, 颜色: 紫色
```

#### 弓箭手类 (Archer)
```
像素风弓箭手，穿皮甲，手持弓箭，绿色基调，射击姿态
风格: pixel, char_type: archer, 颜色: 绿色
```

#### 盗贼类 (Rogue)
```
像素风盗贼，穿夜行衣，刺客装束，红色基调，潜行姿态
风格: pixel, char_type: rogue, 颜色: 红色
```

#### 治疗师类 (Healer)
```
像素风治疗师，穿祭司袍，手持法杖，金色基调，治疗动画
风格: pixel, char_type: healer, 颜色: 金色
```

#### 怪物类 (Monster)
```
像素风哥布林，绿色皮肤，尖锐獠牙，攻击姿态
风格: pixel, char_type: monster, 颜色: 绿色
```

### 生成示例

```bash
# 本地调用
curl -X POST http://localhost:8080/api/generate \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "像素风蓝色战士持剑",
    "style": "pixel",
    "char_type": "warrior",
    "render_mode": "ai",
    "include_png": true
  }'
```

### 输出格式

| 格式 | 用途 |
|------|------|
| Spine JSON | 骨骼动画 |
| Unity .controller | Unity动画状态机 |
| Godot .tscn | Godot场景 |
| PNG SpriteSheet | 精灵序列帧 |

### Chess Arena 棋子清单

| 棋子 | 类型 | 颜色 | 优先级 |
|------|------|------|--------|
| 人类战士 | warrior | 蓝色 | P0 |
| 人类法师 | mage | 紫色 | P0 |
| 人类弓箭手 | archer | 绿色 | P0 |
| 精灵盗贼 | rogue | 红色 | P1 |
| 精灵牧师 | healer | 金色 | P1 |
| 兽族战士 | warrior | 棕色 | P1 |
| 亡灵法师 | mage | 黑色 | P2 |

---
更新日期: 2026-04-17