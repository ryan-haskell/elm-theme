module Theme.Html exposing (..)

{-|

@docs Theme, new, toHtml
@docs Html, Attribute

-}

import Css
import Css.Global
import Html
import Html.Styled
import Html.Styled.Attributes
import Theme.Color
import Theme.FontSize
import Theme.Spacing


type alias Theme color fontSize spacing =
    { toColor : color -> Theme.Color.Color
    , toFontSize : fontSize -> Theme.FontSize.FontSize
    , toSpacing : spacing -> Theme.Spacing.Spacing
    }


new :
    { toColor : color -> Theme.Color.Color
    , toFontSize : fontSize -> Theme.FontSize.FontSize
    , toSpacing : spacing -> Theme.Spacing.Spacing
    }
    -> Theme color fontSize spacing
new options =
    options


toHtml :
    Theme color fontSize spacing
    -> List (Attribute color fontSize spacing msg)
    -> Html color fontSize spacing msg
    -> Html.Html msg
toHtml theme attrs (Html viewApp) =
    Html.Styled.toUnstyled
        (Html.Styled.div
            (Html.Styled.Attributes.class "elm-theme" :: toHtmlStyledAttributes Col theme attrs)
            [ viewReset
            , viewApp Col theme
            ]
        )


viewReset : Html.Styled.Html msg
viewReset =
    Css.Global.global
        [ Css.Global.everything
            [ Css.minHeight Css.zero
            , Css.margin Css.zero
            , Css.padding Css.zero
            , Css.color Css.inherit
            , Css.property "font" "inherit"
            ]
        , Css.Global.body
            [ Css.fontFamilies
                [ "-apple-system"
                , "BlinkMacSystemFont"
                , "Segoe UI"
                , "Roboto"
                , "Helvetica"
                , "Arial"
                , "sans-serif"
                , "Apple Color Emoji"
                , "Segoe UI Emoji"
                , "Segoe UI Symbol"
                ]
            ]
        , Css.Global.each [ Css.Global.body, Css.Global.html, Css.Global.class "elm-theme" ]
            [ Css.height (Css.pct 100)
            ]
        , Css.Global.class "elm-theme" columnStyles
        ]



-- HTML


type Html color fontSize spacing msg
    = Html (Layout -> Theme color fontSize spacing -> Html.Styled.Html msg)


type Layout
    = Col
    | Row


columnStyles : List Css.Style
columnStyles =
    [ Css.displayFlex, Css.flexDirection Css.column ]



-- INTERNALS


toHtmlStyledAttributes :
    Layout
    -> Theme color fontSize spacing
    -> List (Attribute color fontSize spacing msg)
    -> List (Html.Styled.Attribute msg)
toHtmlStyledAttributes layout theme attrs =
    let
        toCssStyle : Attribute color fontSize spacing msg -> List Css.Style
        toCssStyle attr =
            case attr of
                Style fn ->
                    fn layout theme
    in
    [ Html.Styled.Attributes.css (List.concatMap toCssStyle attrs) ]


toHtmlStyled :
    Layout
    -> Theme color fontSize spacing
    -> Html color fontSize spacing msg
    -> Html.Styled.Html msg
toHtmlStyled layout theme (Html fromThemeToHtml) =
    fromThemeToHtml layout theme



-- ATTRIBUTES


type Attribute color fontSize spacing msg
    = Style (Layout -> Theme color fontSize spacing -> List Css.Style)
