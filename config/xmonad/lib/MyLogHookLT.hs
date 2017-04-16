module MyLogHookLT
( myLogHookLT
) where

import XMonad

-- hooks --
import XMonad.Hooks.DynamicLog
import GHC.IO.Handle.Types

-- miscellaneous --
import System.IO

-- own module: configuration decomposition --
import MyColor

-------------------------------------------------------------------------------

dcColor = myColor "Decoration"
makeSpace = wrap "   " "   "
wrapXBitmapL bitmap = " ^i(.xmonad/assets/layout/"++bitmap++")  "
wrapXBitmapT bitmap = "^i(.xmonad/assets/"++bitmap++")"

myLogHookLT :: Handle -> X ()
myLogHookLT h = dynamicLogWithPP $ def
  { ppOutput    = hPutStrLn h
  , ppSep       = ""
  , ppTitle     = titleWrapper . makeSpace
                . (" " ++) . (icon_run ++) . (" " ++)
                . shorten 50
                . ( \t -> if null t then "Terry Munro Desktop" else t )
  , ppLayout    = buttonLayout . makeSpace .
                  (\x -> case x of
                         "common"       -> icon_comm
                         "screenshot"   -> icon_scre
                         "working"      -> icon_work
                         "browser"      -> icon_full
                         _              -> x
                  )
  , ppOrder     = \(ws:l:t:_) -> [l,t]
  }
  where
    titleWrapper = wrap ("^fg("++dcColor++")^i(.xmonad/assets/deco/mr1.xbm)^fg()") ""
    buttonLayout = wrap ("^ca(1,xdotool key super+space)^bg("++dcColor++")") "^bg()^ca()"
    icon_comm = wrapXBitmapL "mptall.xbm" ++ "  Tall (1/3)"
    icon_scre = wrapXBitmapL "sptall.xbm" ++ "  Tall (1/2)"
    icon_work = wrapXBitmapL "grid.xbm"   ++ "  Default"
    icon_full = wrapXBitmapL "full.xbm"   ++ "  Full"
    icon_run  = wrapXBitmapT "misc/heart.xbm"
