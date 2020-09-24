import os
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

mod = "mod4"
confirm_prompt = widget.Prompt()

color = {
    'background': '#21222c',
    'foreground': '#f8f8f2',
    'active': '#6272a4',
    'inactive': '#44475a',
    'urgent': '#ff5555',
    'floating': '#8be9fd',
}

@hook.subscribe.startup_once
def autostart():
    autostart = os.path.expanduser('~/.config/qtile/autostart.sh')
    os.system(f'{autostart}')

def update_widget(distribution):
    '''
    Arch, Debian, Ubuntu, Fedora and FreeBSD are supported
    '''
    if distribution == 'Arch':
        return widget.Pacman(background=color['active'], foreground=color['foreground'])
    else:
        return widget.CheckUpdates(distro=distribution, background=color['active'], foreground=color['foreground']),

def set_keybindings():
    return [
        #General Key bindings
        Key([mod], "w", lazy.window.kill()),
        Key([mod, "control"], "0", lazy.shutdown()),
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

        # Toggle between different layouts
        Key([mod, "control"], "space", lazy.window.toggle_floating()),
        Key([mod], "f", lazy.window.toggle_fullscreen()),
    ]

def set_groups(g: str):
    groups = [Group(i) for i in g]
    for i in groups:
        # mod1 + letter of group = switch to group
        keys.append(
            Key([mod], i.name, lazy.group[i.name].toscreen())
        )
        # mod1 + shift + letter of group = switch to & move focused window to group
        keys.append(
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name))
        )
    return groups

#My preferred layouts
def set_layouts():
    return [
         layout.MonadTall(border_focus=color['active'], border_width=2, margin=8),
        layout.Max(),
    ]

def set_widget_defaults():
    return {
        'font': 'Ubuntu Regular',
        'fontsize': 16,
        'padding': 4,
    }

def set_widgets():
    def arrow_widget(theme):
        if 'end' in theme:
            image = f'~/.config/qtile/{theme}.png' 
        else:
            image = f'~/.config/qtile/powerline{theme}.png' 
        return widget.Image(filename=image)
    return [
       #Groups and Window names
       widget.GroupBox(inactive=color['inactive'], disable_drag=True, hide_unused=True, this_current_screen_border=color['active'], urgent_border=color['urgent'], highlight_method='block', rounded=False, use_mouse_wheel=False, padding_x=1),
       widget.WindowName(),
       confirm_prompt,
       # System updates
       arrow_widget('endlight'),
       widget.Image(filename='~/.config/qtile/icons/updatelight.png'),
       system_updates,
       # Volume control
       arrow_widget('dark'),
       widget.Image(filename='~/.config/qtile/icons/volumedark.png'),
       widget.Volume(volume_app="pulseaudio", background=color['inactive']),
       # System Resources 
       arrow_widget('light'),
       widget.Image(filename='~/.config/qtile/icons/memorylight.png'),
       widget.Memory(background=color['active']),
       arrow_widget('dark'),
       widget.Image(filename='~/.config/qtile/icons/cpudark.png'),
       widget.CPUGraph(graph_color=color['floating'], border_color=color['active'], background=color['inactive'], type='box'),
       # Date and time widget
       arrow_widget('light'),
       widget.Image(filename='~/.config/qtile/icons/calendarlight.png'),
        widget.Clock(background=color['active'], foreground=color['foreground'], format='%A %Y/%m/%d %H:%M'),
       # System tray
       arrow_widget('dark'),
       widget.Image(filename='~/.config/qtile/icons/systraydark.png'),
       widget.Systray(icon_size=21, padding=6, background=color['inactive']),
    ]

system_updates = update_widget('Arch')
keys = set_keybindings()
layouts = set_layouts()
groups = set_groups('12345678')
widget_defaults = set_widget_defaults()
screens = [
    Screen(
        top=bar.Bar(
            set_widgets(),
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

# Miscellaneous Config Variables
dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(border_focus=color['floating'], border_width=2)
auto_fullscreen = True
focus_on_window_activation = "smart"
extentions = []
wmname = "LG3D"
