import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab
import XMonad.Util.SpawnOnce
import XMonad.Util.Cursor

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

gFont :: String
gFont = "xft:Iosevka Nerd Font Mono:regular:size=9:antialias=true:hinting=true"

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ gConfig

gStartupHook :: X ()
gStartupHook = do
  spawnOnce "picom"
  spawnOnce "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
  spawnOnce "/home/gaby/.fehbg"
  spawnOnce "nm-applet"
  spawn "polybar -r"
  setWMName "LG3D"
  setDefaultCursor xC_left_ptr


gConfig = def
  { modMask = mod4Mask
  , terminal = "kitty"
  , layoutHook = gLayout
  , manageHook = gManageHook
  , startupHook = gStartupHook
  , borderWidth = 2
  , normalBorderColor = "#E5E9F0"
  , focusedBorderColor = "#A3BE8C"
  }
  `additionalKeysP`
    [ ("M-C-s", unGrab *> spawn "flameshot gui")
    , ("M-c"  , spawn "google-chrome-stable"   )
    ]


gManageHook :: ManageHook
gManageHook = composeAll
  [ isDialog --> doFloat
  ]

gLayout = avoidStruts (tiled ||| Full)
  where
    tiled = Tall nmaster delta ratio
    nmaster  = 1
    ratio    = 1/2
    delta    = 3/100
