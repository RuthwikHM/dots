import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.SpawnOnce
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import System.IO
import XMonad.Layout.Spacing

main :: IO()
main = do
    xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
    xmonad $ docks def
        { terminal    = myTerminal
        , modMask     = myModMask
        , startupHook = myStartupHook
        , borderWidth = myBorderWidth
        , normalBorderColor = myNormColor
        , focusedBorderColor = myFocusColor
        , manageHook  = myManageHook <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  myLayout
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
myFocusColor = "#bd93f9"

myWorkspaces = ["Dev","WWW","Files","4","5","6","7","8"]

myStartupHook = do
                    spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 3 --height 18"
                    spawnOnce "nitrogen --restore &"
                    spawnOnce "picom &"
                    spawnOnce "nm-applet &"
                    spawnOnce "volumeicon &"
                    spawnOnce "clipit"
                    spawnOnce "xfce4-power-manager"

myKeys = [
			("M-c", spawn "xmonad --recompile"),
		 	("M-S-r", spawn "xmonad --restart"),
            ("M-d", spawn "dmenu_recency"),
            ("<Print>", spawn "i3-scrot"),
            ("M-<F2>", spawn myBrowser),
            -- ("M-<F1>", spawn "emacs"),
            ("M-<F3>",spawn "st -e ranger")
		 ]

myManageHook = composeAll
   [ className =? "Brave-browser" --> doShift "WWW"
   ,className =? "firefox" --> doShift "WWW"
   , manageDocks
   ]
myLayout = spacingRaw True (Border 0 0 0 0) True (Border 5 5 5 5) True $ tiled ||| Mirror tiled ||| Full
  where
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes
