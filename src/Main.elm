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
    Theme.column
        [ Theme.gap Ui.Spacing.sm, Theme.align.center ]
        [ Theme.typography Ui.FontSize.h1 "Hello, world!"
        , Theme.typography Ui.FontSize.h2 "How are you?"
        ]
