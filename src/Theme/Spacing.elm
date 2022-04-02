module Theme.Spacing exposing
    ( Spacing, fromPixels
    , toCssGap, toCssPad
    )

{-|


## Spacing

Used for the space around elements (`Theme.pad`) or the space between elements (`Theme.gap`)

@docs Spacing, fromPixels


### Internals

@docs toCssGap, toCssPad

-}

import Css


type Spacing
    = Pixels Float


fromPixels : Int -> Spacing
fromPixels px =
    Pixels (toFloat px)


toCssGap : Spacing -> Css.Style
toCssGap spacing =
    case spacing of
        Pixels px ->
            Css.property "gap" (String.fromFloat px ++ "px")


toCssPad : Spacing -> Css.Style
toCssPad spacing =
    case spacing of
        Pixels px ->
            Css.padding (Css.px px)
