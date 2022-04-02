module Ui.Spacing exposing
    ( Spacing
    , sm
    , toThemeSpacing
    )

import Theme.Spacing



-- SPACINGS


type Spacing
    = Sm


sm : Spacing
sm =
    Sm


toThemeSpacing : Spacing -> Theme.Spacing.Spacing
toThemeSpacing spacing =
    case spacing of
        Sm ->
            Theme.Spacing.fromPixels 4
