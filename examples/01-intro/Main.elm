module Main exposing (main)

import Html
import Theme
import Ui
import Ui.FontSize
import Ui.Spacing


main : Html.Html msg
main =
    Ui.toHtml [ Theme.align.centerY ] view


view : Ui.Html msg
view =
    Ui.column
        [ Ui.gap Ui.Spacing.Sm, Ui.align.center ]
        [ Ui.typography Ui.FontSize.H1 "Hello, world!"
        , Ui.typography Ui.FontSize.H2 "How are you?"
        ]
