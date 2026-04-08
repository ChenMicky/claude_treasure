# 專案總覽 - Interactive Treasure Hunt Game

## 基本資訊

**專案名稱**: Interactive Treasure Box Game  
**類型**: Web 遊戲  
**目的**: 教育性質的互動式海盜尋寶遊戲  
**版本**: 0.1.0 (Initial Branch)  
**最後更新**: 2026-04-04

---

## 專案描述

這是一個使用 React + TypeScript + Vite 構建的互動式寶藏遊戲。玩家點擊三個寶箱來尋找寶藏：
- 找到寶藏：+$100 💰
- 遇到骷髏：-$50 💀

遊戲結束時顯示 WIN/TIE/LOSE 結果，並支援重新開始。

---

## 技術棧

### 核心技術
- **React 18.3.1** - UI 框架
- **TypeScript** - 類型安全
- **Vite 6.3.5** - 構建工具和開發服務器
- **Framer Motion** - 動畫庫

### UI 和樣式
- **Tailwind CSS v4** - 工具類 CSS 框架
- **Radix UI** - 無障礙組件基礎
- **shadcn/ui** - 預構建 UI 組件庫（40+ 組件）
- **Lucide React** - 圖標庫

### 開發工具
- **@vitejs/plugin-react-swc** - 快速 React 刷新
- **Node.js 20+** - 運行環境

---

## 專案結構

```
claude_code_treasure_game/
├── .claude/
│   └── memory/              # Memory Bank 系統
├── src/
│   ├── App.tsx              # 主遊戲組件（220 行）
│   ├── main.tsx             # 應用入口
│   ├── index.css            # 全局樣式
│   ├── assets/              # 遊戲資源
│   │   ├── treasure_closed.png
│   │   ├── treasure_opened.png
│   │   ├── treasure_opened_skeleton.png
│   │   └── key.png
│   ├── audios/              # 音效文件
│   │   ├── chest_open.mp3
│   │   └── chest_open_with_evil_laugh.mp3
│   ├── components/
│   │   ├── figma/
│   │   └── ui/              # shadcn/ui 組件（40+ 個）
│   ├── guidelines/
│   │   └── Guidelines.md
│   └── styles/
│       └── globals.css
├── CLAUDE.md                # 完整專案文檔
├── README.md                # 使用說明
├── package.json
└── vite.config.ts
```

---

## 快速開始

```bash
# 安裝依賴
npm install

# 啟動開發服務器
npm run dev
# 訪問 http://localhost:3000

# 構建生產版本
npm run build
```

---

## Git 倉庫

- **Remote**: https://github.com/uopsdod/claude_code_treasure_game.git
- **當前分支**: initial
- **其他分支**: main, complete

---

## 相關文檔

- `CLAUDE.md` - 完整的專案文檔（314 行）
- `README.md` - 用戶使用指南
- `Attributions.md` - 資源版權聲明
- `Guidelines.md` - 開發指南

---

## 專案狀態

- ✅ 核心遊戲功能完整
- ✅ 音效已集成
- ✅ 動畫效果完善
- ⚠️ 有未提交的更改（音效功能和 WIN/LOSE 顯示）
