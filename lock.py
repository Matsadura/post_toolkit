#!/usr/bin/env python3
import time
import subprocess
from pynput import keyboard

def on_lock():
    try:
        subprocess.run(['/usr/local/bin/ft_lock'], check=True)
        subprocess.run(['/usr/bin/bash', '/home/zzaoui/Documents/bt_off.bash'], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error executing lock command: {e}")
    except FileNotFoundError:
        print("Lock command not found at /usr/local/bin/ft_lock")

def on_logout():
    try:
        subprocess.run(['/usr/bin/bash', '/home/zzaoui/Documents/bt_off.bash'], check=True)
        subprocess.run(['/usr/bin/gnome-session-quit', '--logout', '--no-prompt'], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error executing logout command: {e}")


def for_canonical(f):
    return lambda k: f(l.canonical(k))

with keyboard.GlobalHotKeys({
    '<cmd>+l': on_logout,
    '<cmd>+q': on_lock,
}) as h:
    h.join()
