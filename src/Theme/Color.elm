module Theme.Color exposing (Color, fromHexCode, toCssFontColor)

import Css


type Color
    = Hex String


fromHexCode : String -> Color
fromHexCode str =
    Hex str


toCssFontColor : Color -> Css.Style
toCssFontColor color =
    case color of
        Hex hex ->
            Css.color (Css.hex hex)
