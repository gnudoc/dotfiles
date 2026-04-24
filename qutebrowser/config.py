# Prevent autoconfig from overwriting our manual settings
config.load_autoconfig(False)

# Enable GPU rasterization, zero-copy routing, and VA-API decoding
c.qt.args = [
    "ignore-gpu-blocklist",
    "enable-gpu-rasterization",
    "enable-zero-copy",
    "enable-features=VaapiVideoDecodeLinuxGL"
]

# --- Colors & Theming ---
bg_default = "#1a1b26"
fg_default = "#c0caf5"
bg_highlight = "#33ccff"
fg_highlight = "#000000"

# Force Dark Mode on web pages
config.set('colors.webpage.darkmode.enabled', True)
config.set('colors.webpage.preferred_color_scheme', 'dark')

# Statusbar
c.colors.statusbar.normal.bg = bg_default
c.colors.statusbar.normal.fg = fg_default
c.colors.statusbar.command.bg = bg_default
c.colors.statusbar.command.fg = fg_default
c.colors.statusbar.insert.bg = bg_highlight
c.colors.statusbar.insert.fg = fg_highlight

# Tabs
c.colors.tabs.even.bg = bg_default
c.colors.tabs.even.fg = fg_default
c.colors.tabs.odd.bg = bg_default
c.colors.tabs.odd.fg = fg_default
c.colors.tabs.selected.even.bg = bg_highlight
c.colors.tabs.selected.even.fg = fg_highlight
c.colors.tabs.selected.odd.bg = bg_highlight
c.colors.tabs.selected.odd.fg = fg_highlight

# Command Line Completion Menu
c.colors.completion.even.bg = bg_default
c.colors.completion.odd.bg = bg_default
c.colors.completion.fg = fg_default
c.colors.completion.item.selected.bg = bg_highlight
c.colors.completion.item.selected.fg = fg_highlight
c.colors.completion.item.selected.border.top = bg_highlight
c.colors.completion.item.selected.border.bottom = bg_highlight

# --- Emacs Bindings for Text Fields (Insert Mode) ---
# We use 'fake-key' to send standard keystrokes to the underlying web engine
config.bind('<Ctrl-f>', 'fake-key <Right>', mode='insert')
config.bind('<Ctrl-b>', 'fake-key <Left>', mode='insert')
config.bind('<Ctrl-a>', 'fake-key <Home>', mode='insert')
config.bind('<Ctrl-e>', 'fake-key <End>', mode='insert')
config.bind('<Ctrl-n>', 'fake-key <Down>', mode='insert')
config.bind('<Ctrl-p>', 'fake-key <Up>', mode='insert')
config.bind('<Alt-f>', 'fake-key <Ctrl-Right>', mode='insert')
config.bind('<Alt-b>', 'fake-key <Ctrl-Left>', mode='insert')
config.bind('<Ctrl-d>', 'fake-key <Delete>', mode='insert')
config.bind('<Alt-d>', 'fake-key <Ctrl-Delete>', mode='insert')
config.bind('<Ctrl-w>', 'fake-key <Ctrl-Backspace>', mode='insert')
config.bind('<Ctrl-k>', 'fake-key <Shift-End><Delete>', mode='insert')
config.bind('<Ctrl-u>', 'fake-key <Shift-Home><Delete>', mode='insert')
config.bind('<Ctrl-y>', 'insert-text {clipboard}', mode='insert')

# --- Emacs Bindings for the Command Line (Command Mode) ---
# Qutebrowser natively supports readline functions here
config.bind('<Ctrl-f>', 'rl-forward-char', mode='command')
config.bind('<Ctrl-b>', 'rl-backward-char', mode='command')
config.bind('<Ctrl-a>', 'rl-beginning-of-line', mode='command')
config.bind('<Ctrl-e>', 'rl-end-of-line', mode='command')
config.bind('<Ctrl-n>', 'command-history-next', mode='command')
config.bind('<Ctrl-p>', 'command-history-prev', mode='command')
config.bind('<Ctrl-d>', 'rl-delete-char', mode='command')
config.bind('<Ctrl-k>', 'rl-kill-line', mode='command')
config.bind('<Ctrl-w>', 'rl-unix-word-rubout', mode='command')
config.bind('<Ctrl-y>', 'rl-yank', mode='command')

# --- Emacs Bindings for General Browsing (Normal Mode) ---
# Page Navigation
config.bind('<Ctrl-v>', 'scroll-page 0 0.5')
config.bind('<Alt-v>', 'scroll-page 0 -0.5')

# Search (maps C-s to forward search, C-r to backward search)
config.bind('<Ctrl-s>', 'cmd-set-text /')
config.bind('<Ctrl-r>', 'cmd-set-text ?')

# Buffer / Tab Management
config.bind('<Ctrl-x>b', 'cmd-set-text -s :buffer')
config.bind('<Ctrl-x>k', 'tab-close')

# Cancel chains (C-g)
config.bind('<Ctrl-g>', 'clear-keychain', mode='normal')

