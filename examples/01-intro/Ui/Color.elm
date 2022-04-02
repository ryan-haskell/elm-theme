module Ui.Color exposing (Color(..), toThemeColor)

import Theme.Color


type Color
    = Red


toThemeColor : Color -> Theme.Color.Color
toThemeColor color =
    case color of
        Red ->
            Theme.Color.fromHexCode "#ff0000"
