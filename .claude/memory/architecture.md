# 架構設計 - Treasure Hunt Game

## 架構概覽

這是一個單頁應用（SPA），使用 React 函數組件和 Hooks 進行狀態管理。

---

## 組件架構

### 主要組件

```
App (src/App.tsx)
├── Header Section (標題和說明)
├── Score Display (分數顯示)
│   └── Win/Tie/Lose Indicator (遊戲結果)
├── Game Board (遊戲區域)
│   └── Box × 3 (三個寶箱)
│       ├── Chest Image (寶箱圖片)
│       ├── Animation Overlay (動畫層)
│       └── Score Badge (分數標記)
└── Game Over Section (遊戲結束)
    └── Play Again Button (重新開始按鈕)
```

### 組件庫

位於 `src/components/ui/`，包含 40+ shadcn/ui 組件：
- Button, Card, Dialog, Alert
- Form 相關組件
- Navigation 組件
- Layout 組件
- 等等...

---

## 狀態管理

### React State (useState)

```typescript
// 遊戲狀態
const [boxes, setBoxes] = useState<Box[]>([])
const [score, setScore] = useState(0)
const [gameEnded, setGameEnded] = useState(false)

// Box 介面
interface Box {
  id: number
  isOpen: boolean
  hasTreasure: boolean
}
```

### 狀態流向

```
初始化
  ↓
initializeGame()
  ↓
隨機分配寶藏 → 創建3個Box
  ↓
用戶點擊
  ↓
openBox(id)
  ↓
更新 Box 狀態 + 播放音效
  ↓
計算分數
  ↓
檢查遊戲結束條件
  ↓
顯示結果 (WIN/TIE/LOSE)
```

---

## 數據流

### 單向數據流

```
State (boxes, score, gameEnded)
  ↓
Props → Component Rendering
  ↓
User Interaction (onClick)
  ↓
Event Handler (openBox)
  ↓
State Update (setState)
  ↓
Re-render
```

---

## 關鍵功能模塊

### 1. 遊戲初始化

```typescript
const initializeGame = () => {
  // 隨機選擇一個寶箱放置寶藏
  const treasureBoxIndex = Math.floor(Math.random() * 3)
  
  // 創建3個寶箱
  const newBoxes: Box[] = Array.from({ length: 3 }, (_, index) => ({
    id: index,
    isOpen: false,
    hasTreasure: index === treasureBoxIndex,
  }))
  
  setBoxes(newBoxes)
  setScore(0)
  setGameEnded(false)
}
```

### 2. 寶箱開啟邏輯

```typescript
const openBox = (boxId: number) => {
  if (gameEnded) return // 防止遊戲結束後繼續點擊
  
  setBoxes(prevBoxes => {
    const updatedBoxes = prevBoxes.map(box => {
      if (box.id === boxId && !box.isOpen) {
        // 播放音效
        const audio = new Audio(
          box.hasTreasure ? chestOpenSound : evilLaughSound
        )
        audio.play()
        
        // 更新分數
        const newScore = box.hasTreasure ? score + 100 : score - 50
        setScore(newScore)
        
        return { ...box, isOpen: true }
      }
      return box
    })
    
    // 檢查遊戲結束
    const treasureFound = updatedBoxes.some(
      box => box.isOpen && box.hasTreasure
    )
    const allOpened = updatedBoxes.every(box => box.isOpen)
    
    if (treasureFound || allOpened) {
      setGameEnded(true)
    }
    
    return updatedBoxes
  })
}
```

### 3. 音效系統

- **實現方式**: Web Audio API (HTML5 Audio)
- **音效文件**: MP3 格式
- **觸發時機**: 寶箱開啟時
- **錯誤處理**: catch 捕獲播放失敗

---

## 動畫架構

### Framer Motion 動畫

```typescript
// 懸停效果
whileHover={{ scale: box.isOpen ? 1 : 1.05 }}

// 點擊效果
whileTap={{ scale: box.isOpen ? 1 : 0.95 }}

// 翻轉動畫
animate={{ 
  rotateY: box.isOpen ? 180 : 0,
  scale: box.isOpen ? 1.1 : 1
}}
transition={{ 
  duration: 0.6,
  ease: "easeInOut"
}}

// 淡入動畫
initial={{ opacity: 0, y: 20 }}
animate={{ opacity: 1, y: 0 }}
```

---

## 樣式架構

### Tailwind CSS 方法

- **工具類優先**: 使用 Tailwind 工具類
- **響應式設計**: 使用 `md:` 斷點
- **自定義主題**: 使用 Tailwind 配置
- **玻璃態效果**: `backdrop-blur-sm` + 透明度

### CSS 層級

```
globals.css (全局變量和基礎樣式)
  ↓
Tailwind Utilities (工具類)
  ↓
Component Styles (組件內聯樣式)
```

---

## 構建配置

### Vite 配置 (vite.config.ts)

- **插件**: React SWC (快速刷新)
- **開發服務器**: Port 3000
- **構建輸出**: `build/` 目錄
- **路徑別名**: `@` → `./src`
- **模塊別名**: 大量 Radix UI 組件別名

---

## 性能考慮

### 優化策略

1. **狀態更新**: 使用函數式更新避免閉包問題
2. **條件渲染**: 只在需要時渲染遊戲結束界面
3. **事件防抖**: 遊戲結束後禁用點擊
4. **圖片優化**: 使用適當大小的圖片資源

### 未來優化

- [ ] 使用 useMemo 緩存計算結果
- [ ] 使用 useCallback 優化事件處理器
- [ ] 圖片懶加載
- [ ] 代碼分割

---

## 設計模式

1. **容器組件模式**: App.tsx 作為容器管理所有狀態
2. **受控組件**: 所有狀態由 React 管理
3. **聲明式渲染**: 根據狀態聲明性地渲染 UI
4. **組合優於繼承**: 使用組合構建複雜 UI

---

## 類型系統

### TypeScript 類型

```typescript
// 核心類型定義
interface Box {
  id: number
  isOpen: boolean
  hasTreasure: boolean
}

// 使用 TypeScript 嚴格模式
// tsconfig.json 中啟用嚴格檢查
```

---

## 總結

這是一個**簡單但完整**的 React 應用架構：
- ✅ 清晰的組件層次
- ✅ 單向數據流
- ✅ 類型安全
- ✅ 良好的用戶體驗
- ✅ 可擴展性強
