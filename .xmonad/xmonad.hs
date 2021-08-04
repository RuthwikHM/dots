import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.SpawnOnce
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import System.IO


main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
    xmonad $ docks def
        { terminal    = myTerminal
        , modMask     = myModMask
        , startupHook = myStartupHook
        , borderWidth = myBorderWidth
        , normalBorderColor = myNormColor
        , focusedBorderColor = myFocusColor
        , manageHook  = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                            { ppOutput = hPutStrLn xmproc
                            , ppTitle = xmobarColor "#bd93f9" "" . shorten 50
                            , ppCurrent = xmobarColor "#50fa7b" "" . wrap "[" "]"
                            , ppVisible = xmobarColor "#f8f8f2" "" .wrap " | "" | "
                            , ppSep =  " | "
                            }
        , workspaces = myWorkspaces
        } `additionalKeysP` myKeys

myTerminal = "st"
myEditor = "nvim"
myBrowser = "brave"
myModMask = mod4Mask
myBorderWidth = 2
myNormColor = "#282a36"
myFocusColor = "#44475a"

myWorkspaces = ["dev","www","files","4","5","6","7","8"]

myStartupHook = do
                    spawnOnce "nitrogen --restore &"
                    spawnOnce "picom &"
                    spawnOnce "nm-applet &"
                    spawnOnce "volumeicon &"
                    spawnOnce "clipit"
                    spawnOnce "xfce4-power-manager"
                    spawnOnce "xmobar"

myKeys = [
			("M-c", spawn "xmonad --recompile")
		 	,("M-S-r", spawn "xmonad --restart"),
            ("M-p", spawn "dmenu_recency"),
		 ]
