# Mint OS — Feature Roadmap

## Status Key
```
✅ Done     🔨 In Progress     🎯 Next     💡 Planned     🚀 Future
```

---

## TIER 1 — CORE (Foundation)

| Feature | Status | Details |
|---------|--------|---------|
| Arch Linux base (archiso) | ✅ | Rolling release, official repos only |
| KDE Plasma 6 (Wayland-first) | ✅ | Wayland session default, X11 fallback |
| Btrfs + Snapper snapshots | ✅ | Auto snapshot before every update |
| mint-installer (CLI) | ✅ | Guided disk partitioner |
| Calamares graphical installer | ✅ | Config complete |
| GRUB theme (dark + mint-green) | ✅ | theme.txt complete, needs PNG assets |
| Plymouth boot animation | ✅ | Script complete, needs image assets |
| ZSH + Starship prompt | ✅ | Full config |
| Performance kernel tuning | ✅ | sysctl, udev, zram, schedulers |
| Security hardening | ✅ | UFW, AppArmor, sudo, kernel hardening |
| Docker ISO builder | ✅ | Works on Windows/Mac/Linux |
| GitHub Actions CI/CD | ✅ | 3 channels: stable/beta/nightly |
| 16 mint-* CLI tools | ✅ | fetch, clean, doctor, backup, optimizer... |

---

## TIER 2 — POLISH (Next 60 days)

| Feature | Status | Details |
|---------|--------|---------|
| Mint Nexus control center | 🎯 | Qt/QML unified settings app |
| mint-ai v1 (rule-based) | 🎯 | System diagnostics + suggestions |
| mint-dash terminal dashboard | 🎯 | Live TUI with btop integration |
| mint-gaming-mode | 🎯 | Hybrid gaming mode daemon |
| mint-adaptive daemon | 🎯 | Workload-aware auto-tuning |
| KDE theme (AUR package) | 🎯 | Kvantum + color scheme published |
| SDDM animated login theme | 🎯 | QML animation, mint glow |
| Konsole glassmorphism theme | 🎯 | Full terminal redesign |
| Custom notification applet | 🎯 | Plasma widget replacement |
| mint-pulse widget | 🎯 | Floating system monitor |
| Mint OS website | 🎯 | Download page, docs, screenshots |
| mint-bridge (KDE Connect+) | 🎯 | Enhanced Android integration |

---

## TIER 3 — INTELLIGENCE (Month 3-4)

| Feature | Status | Details |
|---------|--------|---------|
| mint-ai v2 (Ollama LLM) | 💡 | Local LLM, voice, system context |
| Adaptive thermal AI | 💡 | Predicts throttling, adjusts fan curve |
| Smart app preloader | 💡 | ML-based app launch prediction |
| Mint Grid app launcher | 💡 | Full-screen command palette |
| Dynamic wallpaper engine | 💡 | Time/weather/activity-reactive |
| GPU-accelerated blur | 💡 | KWin custom shader backend |
| Mint gaming dashboard | 💡 | SteamOS-style gaming mode UI |
| FPS/latency optimizer | 💡 | Per-game profiles |
| Privacy AI dashboard | 💡 | Visual per-app permission manager |
| Instant rollback UI | 💡 | Visual timeline, sub-30s restore |

---

## TIER 4 — ECOSYSTEM (Month 5-12)

| Feature | Status | Details |
|---------|--------|---------|
| Plugin system SDK | 🚀 | Third-party mint-* extensions |
| Mint OS app store | 🚀 | Discover wrapper with curation |
| Community theme repo | 🚀 | User-submitted Mint OS themes |
| Voice assistant (offline) | 🚀 | Wake word → Whisper → local LLM |
| Cloud sync integration | 🚀 | Nextcloud/S3 for settings + files |
| Mobile companion app | 🚀 | Android app for Mint Bridge |
| ARM edition | 🚀 | Raspberry Pi 5, Snapdragon X |
| Gaming edition spin | 🚀 | SteamOS rival, console-like UX |
| Developer edition spin | 🚀 | All dev tools pre-configured |
| Enterprise edition | 🚀 | LDAP, MDM, central management |

---

## Killer Feature Deep Dives

### mint-ai (The System That Explains Itself)
```
Phase 1: Rule-based engine
  - Reads logs, hardware state, running processes
  - Pattern matches known issues → gives precise advice
  - No internet, no model, just logic

Phase 2: Local LLM (Ollama)
  - 7B parameter model runs locally
  - Full system context injection
  - Natural language system management

Phase 3: Ambient intelligence
  - Always watching (opt-in telemetry)
  - Notifies before problems happen
  - "Your SSD shows early failure signs"
```

### Mint Gaming Mode (The SteamOS Killer)
```
Entry:
  Super+G or steam launch → gaming profile
  or: sudo mint-gaming-mode --on

What changes:
  CPU: all cores performance governor
  GPU: max power state + disable runtime PM
  RAM: zram off, THP always, 4GB huge pages
  NET: gaming traffic prioritized (tc qdisc)
  Compositor: minimal effects mode
  Notifications: DO NOT DISTURB
  Background services: suspended
  MangoHud: auto-enabled
  GameMode: active

Exit:
  Super+G again or game exit → normal profile
  All settings restored instantly
```

### Instant Rollback (The Feature That Saves Lives)
```
How it works:
  Every transaction → btrfs snapshot (automatic)
  Snapshots labeled: "pacman -Syu 2026-05-14"
  
User experience:
  sudo mint-rollback
  → Shows visual timeline: ●──●──●──●──●── now
  → "3 hours ago: System worked perfectly"
  → Select → 28 seconds → done
  → Even GRUB failures recoverable from live ISO
  
Technical:
  Btrfs send/receive for incremental snapshots
  Snapshots are ~50MB each (incremental)
  Keep: 50 hourly, 30 daily, 12 weekly, 5 monthly
```
