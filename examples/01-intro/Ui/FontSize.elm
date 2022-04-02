module Ui.FontSize exposing (FontSize(..), toThemeFontSize)

import Theme.FontSize


type FontSize
    = H1
    | H2


toThemeFontSize : FontSize -> Theme.FontSize.FontSize
toThemeFontSize size =
    case size of
        H1 ->
            Theme.FontSize.fromPixels 32

        H2 ->
            Theme.FontSize.fromPixels 24
