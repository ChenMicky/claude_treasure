# Interactive Treasure Box Game - Project Documentation

## 📋 Project Overview

**Interactive Treasure Box Game** is a fun, interactive web-based game built with React, TypeScript, and Vite. Players click on treasure chests to discover what's inside - either treasure (earning points) or skeletons (losing points). The game features smooth animations, sound effects, and an engaging user experience.

### Key Features
- 🎮 Interactive gameplay with 3 treasure chests
- 💰 Scoring system: +$100 for treasure, -$50 for skeleton
- 🎨 Beautiful animations using Framer Motion
- 🔊 Sound effects for chest opening
- 📱 Responsive design with Tailwind CSS
- ♻️ Replay functionality
P
---

## 🏗️ Technology Stack

### Core Technologies
- **React 18.3.1** - UI library
- **TypeScript** - Type-safe development
- **Vite 6.3.5** - Build tool and dev server
- **Framer Motion** - Animation library

### UI Components & Styling
- **Tailwind CSS v4** - Utility-first CSS framework
- **Radix UI** - Accessible component primitives
- **shadcn/ui** - Pre-built UI component library
- **Lucide React** - Icon library

### Development Tools
- **@vitejs/plugin-react-swc** - Fast React refresh with SWC
- **Node 20+** - Runtime environment

---

## 📁 Project Structure

```
claude_code_treasure_game/
├── src/
│   ├── App.tsx                 # Main game component
│   ├── main.tsx                # Application entry point
│   ├── index.css               # Global styles (Tailwind CSS)
│   ├── assets/                 # Game assets
│   │   ├── treasure_closed.png       # Closed chest image
│   │   ├── treasure_opened.png       # Opened chest with treasure
│   │   ├── treasure_opened_skeleton.png  # Opened chest with skeleton
│   │   └── key.png             # Key icon (for hover effect challenge)
│   ├── audios/                 # Sound effects
│   │   ├── chest_open.mp3      # Normal chest open sound
│   │   └── chest_open_with_evil_laugh.mp3  # Skeleton chest sound
│   ├── components/             # Reusable components
│   │   ├── figma/              # Figma-related components
│   │   └── ui/                 # shadcn/ui components (40+ components)
│   ├── guidelines/             # Project guidelines
│   │   └── Guidelines.md       # Development guidelines
│   └── styles/                 # Additional styles
│       └── globals.css         # Global CSS variables
├── index.html                  # HTML entry point
├── package.json                # Dependencies and scripts
├── vite.config.ts              # Vite configuration
├── Attributions.md             # Asset attributions
└── README.md                   # Project README
```

---

## 🎮 Game Logic

### Game State Management
The game uses React's `useState` hook to manage:
- **boxes**: Array of 3 box objects with properties:
  - `id`: Unique identifier
  - `isOpen`: Boolean for open/closed state
  - `hasTreasure`: Boolean for treasure/skeleton
- **score**: Current player score
- **gameEnded**: Boolean to track if game is over

### Game Flow
1. **Initialization** (`initializeGame`):
   - Randomly assigns treasure to one of three boxes
   - Resets score to 0
   - Sets all boxes to closed state

2. **Box Opening** (`openBox`):
   - Checks if game has ended (prevents clicking after game over)
   - Updates box state to open
   - Updates score: +$100 for treasure, -$50 for skeleton
   - Triggers game end when treasure is found or all boxes are opened

3. **Game End Conditions**:
   - Treasure found (win condition)
   - All boxes opened without finding treasure (lose condition)

4. **Reset** (`resetGame`):
   - Calls `initializeGame` to start a new game

---

## 🎨 UI/UX Features

### Visual Design
- **Gradient background**: Amber gradient (from-amber-50 to-amber-100)
- **Pirate theme**: Emoji decorations (🏴‍☠️, 💰, 💀)
- **Card-based layout**: Glass-morphism effect with backdrop blur
- **Responsive grid**: 3-column layout on desktop, 1-column on mobile

### Animations (Framer Motion)
- **Hover effect**: Scale up (1.05) on hover
- **Tap effect**: Scale down (0.95) on click
- **Flip animation**: 180° rotation when box opens (0.6s duration)
- **Bounce animation**: Treasure emoji bounces when revealed
- **Pulse animation**: Skeleton emoji pulses when revealed
- **Fade-in effects**: Score updates and game over message

### Interactive Elements
- **Score display**: Real-time score update with color coding
  - Green for positive scores
  - Red for negative scores
- **Status indicators**: Shows "+$100" or "-$50" below each opened box
- **Game over message**: Shows final score and appropriate message
- **Play Again button**: Resets and starts new game

---

## 🔧 Configuration

### Vite Configuration (`vite.config.ts`)
- **Plugin**: React SWC for fast refresh
- **Build target**: ESNext
- **Output directory**: `build/`
- **Dev server**: Port 3000, auto-open browser
- **Path alias**: `@` maps to `./src`
- **Extensive module aliases**: For all Radix UI components

### Package Scripts
```json
{
  "dev": "vite",           // Start development server
  "build": "vite build"    // Build for production
}
```

---

## 🎵 Assets & Attributions

### Images
- **treasure_closed.png**: Closed treasure chest
- **treasure_opened.png**: Opened chest with gold coins
- **treasure_opened_skeleton.png**: Opened chest with skeleton
- **key.png**: Key icon (Flaticon)

### Sound Effects
- **chest_open.mp3**: Normal chest opening sound
  - Source: Freesound.org (steprock)
- **chest_open_with_evil_laugh.mp3**: Skeleton chest sound
  - Source: Freesound.org (miksmusic) & Pixabay

See `Attributions.md` for full attribution details.

---

## 🚀 Getting Started

### Prerequisites
- Node.js 20+ installed
- npm or yarn package manager

### Installation & Running
```bash
# Switch to initial branch (if not already)
git checkout initial

# Install dependencies
npm install

# Start development server
npm run dev
```

The game will open automatically at `http://localhost:3000`

### Building for Production
```bash
npm run build
```
Output will be in the `build/` directory.

---

## 🎯 Development Guidelines

### Code Style
- Use TypeScript for type safety
- Follow React best practices and hooks patterns
- Keep components small and focused
- Use Tailwind CSS utility classes for styling

### Component Guidelines (from Guidelines.md)
- Add comments on top of every new function
- Document input and output parameters
- Keep file sizes small
- Refactor code as you go

---

## 🔮 Future Enhancement Ideas

### Features to Add
1. **Sound Effects**: Integrate audio files for chest opening
   - Use `chest_open.mp3` for treasure
   - Use `chest_open_with_evil_laugh.mp3` for skeleton

2. **Custom Cursor**: Change mouse pointer to key icon on hover
   - Use `key.png` asset

3. **Difficulty Levels**: 
   - More boxes (5, 7, or 10 chests)
   - Multiple treasures
   - Time limits

4. **Leaderboard System**:
   - SQLite for local storage
   - User authentication (sign up/sign in)
   - Guest mode option

5. **Visual Enhancements**:
   - Particle effects on treasure discovery
   - More elaborate animations
   - Theme switcher (pirate, fantasy, modern)

6. **Multiplayer Mode**:
   - Turn-based gameplay
   - Score competition

---

## 📦 Component Library

The project includes 40+ shadcn/ui components in `src/components/ui/`:
- Accordion, Alert Dialog, Avatar, Badge, Button
- Calendar, Card, Carousel, Chart, Checkbox
- Command, Context Menu, Dialog, Drawer, Dropdown Menu
- Form, Hover Card, Input, Label, Menubar
- Navigation Menu, Pagination, Popover, Progress
- Radio Group, Resizable, Scroll Area, Select, Separator
- Sheet, Sidebar, Skeleton, Slider, Sonner (Toast)
- Switch, Table, Tabs, Textarea, Toggle, Tooltip
- And more...

These components are built on Radix UI primitives and styled with Tailwind CSS.

---

## 🐛 Known Issues & Challenges

1. **Sound Integration**: Audio files are present but not yet integrated into the game logic
2. **Custom Cursor**: Key hover effect not implemented
3. **Performance**: Consider memoization for larger box counts

---

## 📝 Development Workflow

### Suggested Workflow (from README.md)
1. Use `@filename` to specify files in context
2. Add incremental features one at a time
3. Check comments on existing changes
4. Use screenshots for visual feedback
5. Use `/context` to manage token usage
6. Use `/compact` to compress context
7. Use **Plan Mode** (Shift+Tab) for complex features

### Deployment Options
- Vercel (via custom command)
- GitHub Pages (via custom command)
- Any static hosting service

---

## 🤝 Contributing

When adding new features:
1. Follow the existing code structure
2. Add appropriate TypeScript types
3. Use Framer Motion for animations
4. Test on different screen sizes
5. Update this documentation

---

## 📄 License

This project is for educational purposes. Asset attributions are listed in `Attributions.md`.

---

## 🎓 Learning Resources

This project demonstrates:
- React functional components and hooks
- TypeScript interfaces and types
- CSS animations with Framer Motion
- Responsive design with Tailwind CSS
- Component composition patterns
- State management in React
- Vite build tool configuration

---

**Last Updated**: March 31, 2026
**Version**: 0.1.0 (Initial Branch)
