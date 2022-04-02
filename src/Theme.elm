module Theme exposing
    ( column
    , typography
    , fontSize, fontColor
    , align, gap, pad
    )

{-|

@docs Theme, new, toHtml

@docs Html, column
@docs typography

@docs Attribute
@docs fontSize, fontColor
@docs align, gap, pad

-}

import Css
import Html.Styled
import Theme.Color
import Theme.FontSize
import Theme.Html
import Theme.Spacing


type alias Html color fontSize spacing msg =
    Theme.Html.Html color fontSize spacing msg


column : List (Attribute color fontSize spacing msg) -> List (Html color fontSize spacing msg) -> Html color fontSize spacing msg
column attrs children =
    Theme.Html.Html
        (\layout theme ->
            Html.Styled.div
                (Theme.Html.toHtmlStyledAttributes layout
                    theme
                    (Theme.Html.Style (\_ _ -> Theme.Html.columnStyles) :: attrs)
                )
                (List.map (Theme.Html.toHtmlStyled layout theme) children)
        )


typography : fontSize -> String -> Html color fontSize spacing msg
typography size label =
    Theme.Html.Html
        (\layout theme ->
            Html.Styled.h1
                (Theme.Html.toHtmlStyledAttributes
                    layout
                    theme
                    [ fontSize size
                    ]
                )
                [ Html.Styled.text label ]
        )


type alias Attribute color fontSize spacing msg =
    Theme.Html.Attribute color fontSize spacing msg


fontSize : fontSize -> Attribute color fontSize spacing msg
fontSize size =
    Theme.Html.Style (\_ theme -> [ Theme.FontSize.toCssFontSize (theme.toFontSize size) ])


fontColor : color -> Attribute color fontSize spacing msg
fontColor color =
    Theme.Html.Style (\_ theme -> [ Theme.Color.toCssFontColor (theme.toColor color) ])


gap : spacing -> Attribute color fontSize spacing msg
gap spacing =
    Theme.Html.Style (\_ theme -> [ Theme.Spacing.toCssGap (theme.toSpacing spacing) ])


pad : spacing -> Attribute color fontSize spacing msg
pad spacing =
    Theme.Html.Style (\_ theme -> [ Theme.Spacing.toCssPad (theme.toSpacing spacing) ])


align :
    { center : Attribute color fontSize spacing msg
    , centerX : Attribute color fontSize spacing msg
    , centerY : Attribute color fontSize spacing msg
    }
align =
    { center = Theme.Html.Style (\_ _ -> [ Css.alignItems Css.center, Css.justifyContent Css.center ])
    , centerX =
        Theme.Html.Style
            (\layout _ ->
                case layout of
                    Theme.Html.Row ->
                        [ Css.justifyContent Css.center ]

                    Theme.Html.Col ->
                        [ Css.alignItems Css.center ]
            )
    , centerY =
        Theme.Html.Style
            (\layout _ ->
                case layout of
                    Theme.Html.Row ->
                        [ Css.alignItems Css.center ]

                    Theme.Html.Col ->
                        [ Css.justifyContent Css.center ]
            )
    }
