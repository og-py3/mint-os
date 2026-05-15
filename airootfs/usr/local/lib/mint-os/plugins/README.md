# Mint OS Plugin System

## Overview

The Mint OS plugin system allows third-party developers to extend any `mint-*` tool without modifying core files.

## Plugin Structure

```
/usr/local/lib/mint-os/plugins/
├── mint-ai/
│   ├── custom-model.plugin       # Add a custom AI model/backend
│   └── system-advisor.plugin     # Custom analysis rules
├── mint-dash/
│   ├── fan-speed.plugin          # Add fan speed widget
│   ├── gpu-temp.plugin           # GPU temperature display
│   └── network-speed.plugin      # Per-interface network widget
├── mint-gaming-mode/
│   ├── rgb-lighting.plugin       # OpenRGB integration
│   ├── overclocking.plugin       # CPU/GPU overclock profiles
│   └── headset-surround.plugin   # 7.1 surround sound mode
├── mint-optimizer/
│   ├── gaming-studio.plugin      # Studio recording profile
│   └── video-editing.plugin      # Video editing profile
└── mint-doctor/
    ├── smart-extended.plugin     # Extended SMART diagnostics
    └── network-security.plugin   # Network security checks
```

## Creating a Plugin

1. Create a `.plugin` file in the appropriate subdirectory:

```bash
#!/usr/bin/env bash
# Plugin metadata
PLUGIN_NAME="My Custom Plugin"
PLUGIN_VERSION="1.0.0"
PLUGIN_AUTHOR="Your Name"
PLUGIN_DESCRIPTION="What this plugin does"
PLUGIN_HOOK="post_analyze"   # Which hook to attach to

# Hook implementation
hook_post_analyze() {
    # Your code here
    echo "Custom analysis result..."
}

# Register
register_hook "$PLUGIN_HOOK" "hook_post_analyze"
```

2. Make it executable: `chmod +x my-plugin.plugin`

3. The parent tool auto-discovers plugins in its plugin directory on startup.

## Available Hooks

### mint-ai hooks
- `pre_analyze` — runs before system analysis
- `post_analyze` — runs after system analysis
- `on_alert` — triggered when an alert is raised
- `on_query` — runs when user asks a question
- `on_suggest` — runs during suggestion generation

### mint-dash hooks
- `add_widget` — adds a new display widget
- `on_refresh` — called every refresh cycle
- `on_alert` — called when a metric exceeds threshold

### mint-gaming-mode hooks
- `on_enable` — runs when gaming mode is activated
- `on_disable` — runs when gaming mode is deactivated
- `pre_optimize` — before optimization steps
- `post_optimize` — after optimization steps

### mint-doctor hooks
- `add_check` — add a custom diagnostic check
- `on_fail` — called when a check fails
- `on_pass` — called when a check passes

## Plugin Distribution

Plugins can be distributed:
1. As AUR packages (`mint-os-plugin-*`)
2. Via the Mint OS plugin repository (coming in v2)
3. Manually by placing `.plugin` files in the correct directory
