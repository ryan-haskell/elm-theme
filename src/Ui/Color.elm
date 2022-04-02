module Ui.Color exposing (Color, red, toThemeColor)

import Theme.Color



-- COLORS


type Color
    = Red


red : Color
red =
    Red


toThemeColor : Color -> Theme.Color.Color
toThemeColor color =
    case color of
        Red ->
            Theme.Color.fromHexCode "#ff0000"
