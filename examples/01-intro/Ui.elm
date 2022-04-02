module Ui exposing (Html, Attribute, toHtml)

{-|

@docs Html, Attribute, toHtml

-}

import Html
import Theme.Html
import Ui.Color
import Ui.FontSize
import Ui.Spacing


type alias Html msg =
    Theme.Html.Html Ui.Color.Color Ui.FontSize.FontSize Ui.Spacing.Spacing msg


type alias Attribute msg =
    Theme.Html.Attribute Ui.Color.Color Ui.FontSize.FontSize Ui.Spacing.Spacing msg


type alias Theme =
    Theme.Html.Theme Ui.Color.Color Ui.FontSize.FontSize Ui.Spacing.Spacing


theme : Theme
theme =
    Theme.Html.new
        { toColor = Ui.Color.toThemeColor
        , toFontSize = Ui.FontSize.toThemeFontSize
        , toSpacing = Ui.Spacing.toThemeSpacing
        }


toHtml : List (Attribute msg) -> Html msg -> Html.Html msg
toHtml =
    Theme.Html.toHtml theme
