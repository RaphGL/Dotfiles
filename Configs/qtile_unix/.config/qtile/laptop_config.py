import os
import subprocess
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

mod = "mod4"
confirm_prompt = widget.Prompt()

color = {
    'background': '#21222c',
    'white': '#f8f8f2',
    'active': '#6272a4',
    'inactive': '#44475a',
    'red': '#ff5555',
    'purple': '#6272a4',
    'blue': '#8be9fd',
}

@hook.subscribe.startup_once
def autostart():
    autostart = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([autostart])

keys = [
    #General Key bindings
    Key([mod], "w", lazy.window.kill()),
    Key([mod, "control"], "0", lazy.shutdown()),
    Key([mod, "control"], "9", lazy.spawn('betterlockscreen -l')),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod], "Tab", lazy.next_layout()),

    #Move between windows
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    #Change window size
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "u", lazy.layout.shrink()),
    Key([mod], "y", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),

    #Move the windows around
    Key([mod, "control"], "j", lazy.layout.shuffle_down()),
    Key([mod, "control"], "k", lazy.layout.shuffle_up()),
    Key([mod, "control"], "h", lazy.layout.swap_left()),
    Key([mod, "control"], "l", lazy.layout.swap_right()),

    #Volume control
    Key([mod], "Up", lazy.spawn("pactl set-sink-volume 0 +5%")),
    Key([mod], "Down", lazy.spawn("pactl set-sink-volume 0 -5%")),

    # Music control
    Key([mod], "Left", lazy.spawn("cmus-remote -r")),
    Key([mod], "Right", lazy.spawn("cmus-remote -n")),
    Key([mod], "p", lazy.spawn("cmus-remote -u")),

    #Personal Key bindings for programs
    Key([mod], "v", lazy.spawn("urxvt -e ranger")),
    Key([mod], "c", lazy.spawn("urxvt -e calcurse")),
    Key([mod], "m", lazy.spawn("urxvt -e cmus")),
    Key([mod], "r", lazy.spawn("rofi -show run")),
    Key([mod], "n", lazy.spawn("urxvt -e nmtui")),
    Key([mod], "Return", lazy.spawn("urxvt")),
    Key([mod], "F1", lazy.spawn("thunar")),
    Key([mod], "F2", lazy.spawn("firefox")),
    Key([mod], "F3", lazy.spawn("code")),
    Key([mod], "F4", lazy.spawn("urxvt -e htop")),
    Key([mod], "F5", lazy.spawn("thunderbird")),
    Key([mod], "F6", lazy.spawn("joplin-desktop")),

   # Toggle between different layouts
   Key([mod, "control"], "space", lazy.window.toggle_floating()),
   Key([mod], "f", lazy.window.toggle_fullscreen()),
]

groups = [Group(i) for i in "12345678"]
for i in groups:
    # mod1 + letter of group = switch to group
    keys.append(
        Key([mod], i.name, lazy.group[i.name].toscreen())
    )

    # mod1 + shift + letter of group = switch to & move focused window to group
    keys.append(
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name))
    )

#My preferred layouts
layouts = [
    layout.Max(),
    layout.MonadTall(border_focus=color['active'], border_width=2, margin=8),
]

widget_defaults = dict(
    font='Source Han Sans JP Medium',
    fontsize=16,
    padding=4,
)

screens = [
    Screen(
        top=bar.Bar(
            [
                #Groups and Window names
                widget.GroupBox(inactive=color['inactive'], disable_drag=True, hide_unused=True, this_current_screen_border=color['active'], urgent_border=color['red'], highlight_method='block', rounded=False, use_mouse_wheel=False, padding=0, borderwidth=4),
                widget.WindowName(fontsize=15),
                confirm_prompt,
                # System updates
                widget.Image(filename='~/.config/qtile/enddark.png'),
                widget.Image(filename='~/.config/qtile/icons/updatedark.png'),
                widget.Pacman(background=color['inactive'], foreground=color['white']),
                # Battery info
                widget.Image(filename='~/.config/qtile/powerlinebright.png'),
                widget.Image(filename='~/.config/qtile/icons/batterybright.png'),
                widget.Battery(format='{percent:2.0%}', background=color['active']),
                # Volume control
                widget.Image(filename='~/.config/qtile/powerlinedark.png'),
                widget.Image(filename='~/.config/qtile/icons/volumedark.png'),
                widget.Volume(volume_app="pulseaudio", background=color['inactive']),
                # Date and time widget
                widget.Image(filename='~/.config/qtile/powerlinebright.png'),
                widget.Image(filename='~/.config/qtile/icons/calendarbright.png'),
                widget.Clock(background=color['purple'], foreground=color['white'], format='%A - %B %d, %Y  %I:%M %p'),
                # System tray
                widget.Image(filename='~/.config/qtile/powerlinedark.png'),
                widget.Image(filename='~/.config/qtile/icons/systraydark.png'),
                widget.Systray(background=color['inactive']),
            ],
            25, background=color['background'],
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

#Boolean Config Variables
dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(border_focus=color['blue'], border_width=2)
auto_fullscreen = True
focus_on_window_activation = "smart"
extentions = []

wmname = "LG3D"
