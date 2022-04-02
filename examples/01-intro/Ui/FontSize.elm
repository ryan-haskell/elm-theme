module Ui.FontSize exposing (FontSize, h1, h2, toThemeFontSize)

import Theme.FontSize



-- FONT SIZES


type FontSize
    = H1
    | H2


h1 : FontSize
h1 =
    H1


h2 : FontSize
h2 =
    H2


toThemeFontSize : FontSize -> Theme.FontSize.FontSize
toThemeFontSize size =
    case size of
        H1 ->
            Theme.FontSize.fromPixels 32

        H2 ->
            Theme.FontSize.fromPixels 24
