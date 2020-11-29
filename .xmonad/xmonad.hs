import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig
import System.IO

main = xmonad $ def
    { terminal    = myTerminal
    , modMask     = myModMask
	, startupHook = myStartupHook
    , borderWidth = myBorderWidth
	, normalBorderColor = myNormColor
	, focusedBorderColor = myFocusColor
    } `additionalKeysP` myKeys

myTerminal = "st"
myEditor = "nvim"
myBrowser = "brave"
myModMask = mod4Mask
myBorderWidth = 2
myNormColor = "#282a36"
myFocusColor = "#44475a"

myStartupHook = do
	spawnOnce "nitrogen --restore &"
	spawnOnce "picom &"
	spawnOnce "nm-applet &"
	spawnOnce "volumeicon &"

myKeys = [
			("M-c", spawn "xmonad --recompile")
			 -- ,("M-Enter", spawn myTerminal)
		 	,("M-S-r", spawn "xmonad --restart")
		 	,("M-S-e", spawn "~/.i3/exit_menu.sh")
		 ]
