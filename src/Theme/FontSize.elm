module Theme.FontSize exposing (FontSize, fromPixels, toCssFontSize)

import Css


type FontSize
    = Pixels Float


fromPixels : Int -> FontSize
fromPixels px =
    Pixels (toFloat px)


toCssFontSize : FontSize -> Css.Style
toCssFontSize fontSize =
    case fontSize of
        Pixels px ->
            Css.fontSize (Css.px px)
