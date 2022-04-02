module Ui exposing
    ( Html, Attribute, toHtml
    , align, column, fontColor, fontSize, gap, pad, typography
    )

{-|

@docs Html, Attribute, toHtml

-}

import Html
import Theme
import Theme.Html
import Ui.Color
import Ui.FontSize
import Ui.Spacing


type alias Html msg =
    Theme.Html.Html
        Ui.Color.Color
        Ui.FontSize.FontSize
        Ui.Spacing.Spacing
        msg


type alias Attribute msg =
    Theme.Html.Attribute
        Ui.Color.Color
        Ui.FontSize.FontSize
        Ui.Spacing.Spacing
        msg


toHtml : List (Attribute msg) -> Html msg -> Html.Html msg
toHtml =
    Theme.Html.toHtml
        { toColor = Ui.Color.toThemeColor
        , toFontSize = Ui.FontSize.toThemeFontSize
        , toSpacing = Ui.Spacing.toThemeSpacing
        }


align :
    { center : Attribute msg
    , centerX : Attribute msg
    , centerY : Attribute msg
    }
align =
    Theme.align


column : List (Attribute msg) -> List (Html msg) -> Html msg
column =
    Theme.column


fontColor : Ui.Color.Color -> Attribute msg
fontColor =
    Theme.fontColor


fontSize : Ui.FontSize.FontSize -> Attribute msg
fontSize =
    Theme.fontSize


gap : Ui.Spacing.Spacing -> Attribute msg
gap =
    Theme.gap


pad : Ui.Spacing.Spacing -> Attribute msg
pad =
    Theme.pad


typography : Ui.FontSize.FontSize -> String -> Html msg
typography =
    Theme.typography
