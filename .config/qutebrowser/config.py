# https://gitlab.com/Zaney/dotfiles/-/blob/master/.config/qutebrowser/config.py

# Use Dracula Color Scheme
# import dracula.draw

# dracula.draw.blood(c, {
#     'spacing': {
#         'vertical': 6,
#         'horizontal': 8
#     }
# })

# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig()

c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}

# Get Rid of Auto Load Dialogue
config.load_autoconfig(False)

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')

# User agent to send.
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://drive.google.com/*')

# Load images automatically in web pages.
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

config.set('content.notifications.enabled', True, 'https://www.youtube.com')

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '$HOME/Downloads'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'multiple'

# Setting default page for when opening new tabs or new windows with
# commands like :open -t and :open -w .
c.url.default_page = 'https://search.brave.com'

c.url.searchengines = {'DEFAULT': 'https://search.brave.com/search?q={}'}

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = '#e0def4'

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#191724'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#191724'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#c4a7e7'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = '#191724'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#191724'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#191724'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#e0def4'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#191724'

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = '#9ccfd8'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#9ccfd8'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = '#191724'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = '#191724'

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = '#eb6f92'

# When you press 'f'
# Font color for hints.
# Type: QssColor
# c.colors.hints.fg = '#ebbcba'
c.colors.hints.fg = '#191724'

# Font color for the matched part of hints.
# Type: QtColor
# c.colors.hints.match.fg = '#9ccfd8'
c.colors.hints.match.fg = '#eccfd8'

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = '#191724'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#191724'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = '#31748f'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#191724'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#191724'

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = '#191724'

# Foreground color of the URL in the statusbar when there's a warning.
# c.colors.statusbar.url.warn.fg = '#05C075'
c.colors.statusbar.url.warn.fg = '#E5C075'

# Background color of the tab bar.
c.colors.tabs.bar.bg = '#191724'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#191724'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#191724'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#191724'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#191724'

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = '#191724'

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = '#282C34'

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = '#191724'

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = '#191724'

c.fonts.default_family = "Hermit"
c.fonts.default_size = '10pt'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '10pt "Hermit"'

# Font used for the debugging console.
# Type: Font
c.fonts.debug_console = '10pt "Hermit"'

# Font used for prompts.
c.fonts.prompts = '10pt "Hermit"'

# Font used in the statusbar.
c.fonts.statusbar = '10pt "Hermit"'

c.auto_save.session = True
c.url.start_pages = ["https://youtube.com"] 

# Bindings for normal mode
config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind('Z', 'hint links spawn st -e youtube-dl {hint-url}')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
