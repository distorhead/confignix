import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageDocks
import qualified Data.Map as M

defKeys = keys xfceConfig
delKeys x = foldr M.delete (defKeys x) (toRemove x)
newKeys x = foldr (uncurry M.insert) (delKeys x) (toAdd x)

toRemove XConfig{modMask = modm} =
    [ (modm, xK_p) ]

toAdd XConfig{modMask = modm} =
        [ ((modm, xK_p), spawn "dmenu_run")
        , ((mod1Mask, xK_F4), kill) ]

main = xmonad xfceConfig
                { modMask = mod4Mask
                , focusFollowsMouse = False
                , terminal = "xfce4-terminal"
                , keys = newKeys
                }
