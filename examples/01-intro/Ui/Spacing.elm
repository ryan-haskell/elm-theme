module Ui.Spacing exposing
    ( Spacing(..)
    , toThemeSpacing
    )

import Theme.Spacing


type Spacing
    = Sm


toThemeSpacing : Spacing -> Theme.Spacing.Spacing
toThemeSpacing spacing =
    case spacing of
        Sm ->
            Theme.Spacing.fromPixels 4
