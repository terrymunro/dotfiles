import XMonad

-- util --
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.SpawnOnce

-- hooks --
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog

-- own module: configuration decomposition --
-- http://learnyouahaskell.com/modules

import MyManageHook
import MyWorkspaces
import MyLayoutHook
import MyLogHookWS
import MyLogHookLT
import MyStatusBar
import MyColor

-- https://pbrisbin.com/posts/xmonad_modules/
-- do '$ ghc xmonad -ilib' in your ~/.xmonad
-- to enable '$ xmonad --recompile'


-------------------------------------------------------------------------------


main = do

  spawn csbdBottomBackground
  spawn csbdBottomRight
  sbLayoutText <- spawnPipe csbdBottomLeft
  sbWorkspace  <- spawnPipe csbdBottomCenter

  spawn csbdTopBackground
  spawn csbdTopLeft
  spawn csbdTopRight
  spawn csbdTopCenter

-- http://xmonad.org/xmonad-docs/xmonad/XMonad-Config.html

  xmonad $ def
    { manageHook          = myManageHook <+> manageDocks <+> manageHook def
    , layoutHook          = myLayoutHook
    , logHook             = (dynamicLogWithPP . myLogHookLT) sbLayoutText <+> myLogHookWS sbWorkspace
    , workspaces          = myWorkspaces
    , terminal            = myTerminal
    , borderWidth         = 3
    , startupHook         = spawnOnce autoload
    , modMask             = mod4Mask
    , normalBorderColor   = myColor "Blue"
    , focusedBorderColor  = myColor "Yellow"
    } `additionalKeys` myKeys
  where
    autoload = "~/.xmonad/assets/bin/autoload.sh"

-- Common
myTerminal = "gnome-terminal"

-------------------------------------------------------------------------------


-- Keys
myKeys = [
    ((mod4Mask .|. shiftMask, xK_z),    spawn "xscreensaver-command -lock")
  , ((mod4Mask, xK_p),
      spawn "dmenu_run -nb orange -nf '#444' -sb yellow -sf black -fn Monospace-9:normal")
  , ((controlMask, xK_Print),           spawn "sleep 0.2; shutter -s")
  , ((0, xK_Print),                     spawn "shutter")
  ]

