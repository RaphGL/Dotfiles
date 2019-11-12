from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
import os
import subprocess

mod = "mod4"

@hook.subscribe.startup_once
def autostart():
    autostart = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([autostart])

keys = [
    #General Key bindings
    Key([mod], "w", lazy.window.kill()),
    Key([mod, "control"], "0", lazy.shutdown()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod], "Tab", lazy.next_layout()),

    #Move between windows
    Key([mod], "j",lazy.layout.down()),
    Key([mod], "k",lazy.layout.up()),
    Key([mod], "h",lazy.layout.left()),
    Key([mod], "l",lazy.layout.right()),

    #Change size of windows
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "u", lazy.layout.shrink()),
    Key([mod], "y", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),

    #Move the windows around
    Key([mod, "control"], "j",lazy.layout.shuffle_down()),
    Key([mod, "control"], "k",lazy.layout.shuffle_up()),
    Key([mod, "control"], "h",lazy.layout.swap_left()),
    Key([mod, "control"], "l",lazy.layout.swap_right()),

    #Personal Key bindings for programs
    Key([mod], "r", lazy.spawn("rofi -show run")),
    Key([mod], "Return", lazy.spawn("konsole")),
    Key([mod, "shift"], "f", lazy.spawncmd("ranger")),
    Key([mod], "F1", lazy.spawn("pcmanfm")),
    Key([mod], "F2", lazy.spawn("firefox")),

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
    layout.MonadTall(border_focus="#FFFFFF", border_width=1, margin=8),
]

widget_defaults = dict(
    font='Arial',
    fontsize=16,
    padding=3,
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(disable_drag=True, hide_unused=True),
                widget.Prompt(),
                widget.WindowName(),
                widget.Systray(),
                widget.Volume(volume_app="pulseaudio"),
                widget.Clock(format='%A - %B %d, %Y  %I:%M %p'),
            ],
            30,
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
floating_layout = layout.Floating()
auto_fullscreen = True
focus_on_window_activation = "smart"
extentions = []

wmname = "LG3D"
