module Bulma.Styled.Columns exposing
    ( ColumnsModifiers
    , Display, mobile, tablet, desktop
    , Gap, gap0, gap1, gap2, gap3, gap4, gap5, gap6, gap7, gap8
    , columnsModifiers
    , columns
    , Column, ColumnModifiers, Offset, columnModifiers, narrowColumnModifiers
    , column
    )

{-| A simple way to build responsive grids.


# Columns

Learn more about columnar grids in the [official docs](http://bulma.io/documentation/grid/columns/).

    myGrid : Html msg
    myGrid =
        columns myColumnsModifiers
            []
            [ column myColumnModifiers
                []
                [ text "First Column"
                ]
            , column myColumnModifiers
                []
                [ text "Second Column"
                ]
            , column myColumnModifiers
                []
                [ text "Third Column"
                ]
            ]

@docs ColumnsModifiers
@docs Display, mobile, tablet, desktop
@docs Gap, gap0, gap1, gap2, gap3, gap4, gap5, gap6, gap7, gap8
@docs columnsModifiers
@docs columns


## Column

@docs Column, ColumnModifiers, Offset, columnModifiers, narrowColumnModifiers
@docs column

-}

import Bulma.Styled.Classes as B
import Bulma.Styled.Helpers exposing (..)
import Bulma.Styled.Modifiers as M
import Bulma.Styled.Modifiers.Internal as Internal
import Html.Styled exposing (Attribute, Html)



-- COLUMNS ---------------------------------------------------------------------


{-| Make a columnar grid! The widths of all your columns should be no greater than twelve.
-}
columns : ColumnsModifiers -> List (Attribute msg) -> List (Column msg) -> Html msg
columns { centered, multiline, gap, display } =
    node "div"
        [ B.columns
        , case centered of
            True ->
                B.isCentered

            False ->
                B.none

        -- , case verticallyCentered of
        --     True  -> B.isVCentered
        --     False -> B.none
        , case multiline of
            True ->
                B.isMultiline

            False ->
                B.none

        -- , B.isVariable
        , case gap of
            Gap0 ->
                B.isGapless

            _ ->
                B.none
        , case gap of
            Gap0 ->
                B.is0

            Gap1 ->
                B.is1

            Gap2 ->
                B.is2

            Gap3 ->
                B.none

            Gap4 ->
                B.is4

            Gap5 ->
                B.is5

            Gap6 ->
                B.is6

            Gap7 ->
                B.is7

            Gap8 ->
                B.is8
        , case display of
            MobileAndBeyond ->
                B.isMobile

            TabletAndBeyond ->
                B.none

            DesktopAndBeyond ->
                B.isDesktop
        ]



-- MODIFIERS --


{-| -}
type alias ColumnsModifiers =
    { multiline : Bool
    , gap : Gap
    , display : Display
    , centered : Bool

    -- , verticallyCentered : Bool
    }


{-| -}
type Gap
    = Gap0
    | Gap1
    | Gap2
    | Gap3
    | Gap4
    | Gap5
    | Gap6
    | Gap7
    | Gap8


{-| -}
gap0 : Gap
gap0 =
    Gap0


{-| -}
gap1 : Gap
gap1 =
    Gap1


{-| -}
gap2 : Gap
gap2 =
    Gap2


{-| -}
gap3 : Gap
gap3 =
    Gap3


{-| -}
gap4 : Gap
gap4 =
    Gap4


{-| -}
gap5 : Gap
gap5 =
    Gap5


{-| -}
gap6 : Gap
gap6 =
    Gap6


{-| -}
gap7 : Gap
gap7 =
    Gap7


{-| -}
gap8 : Gap
gap8 =
    Gap8


{-| -}
type Display
    = MobileAndBeyond
    | TabletAndBeyond
    | DesktopAndBeyond


{-| -}
mobile : Display
mobile =
    MobileAndBeyond


{-| -}
tablet : Display
tablet =
    TabletAndBeyond


{-| -}
desktop : Display
desktop =
    DesktopAndBeyond


{-| Default column attributes.

    myColumnsModifiers : ColumnsModifiers
    myColumnsModifiers
      = { multiline          = False
        , gap                = Gap3
        , display            = TabletAndBeyond
        , centered           = False
        }

    myColumnsModifiers == columnsModifiers

-}
columnsModifiers : ColumnsModifiers
columnsModifiers =
    { multiline = False
    , gap = Gap3
    , display = TabletAndBeyond
    , centered = False

    -- , verticallyCentered = False
    }



-- COLUMN ----------------------------------------------------------------------


{-| -}
type alias Column msg =
    Html msg


{-| -}
type alias Offset =
    M.Width


{-| A column element that is meant to be placed in `columns`.

    myColumn : Html msg
    myColumn =
        column myColumnModifiers
            []
            [ h1 [] [ text "Lorem" ]
            , h2 [] [ text "ipsum" ]
            , h3 [] [ text "dolor" ]
            , h4 [] [ text "sit" ]
            , h5 [] [ text "amet" ]
            ]

-}
column : ColumnModifiers -> List (Attribute msg) -> List (Html msg) -> Column msg
column { widths, offset } =
    node "div"
        [ B.column
        , case widths.mobile of
            Just Internal.Auto ->
                B.none

            Just Internal.Width1 ->
                B.is01Mobile

            Just Internal.Width2 ->
                B.is02Mobile

            Just Internal.Width3 ->
                B.is03Mobile

            Just Internal.Width4 ->
                B.is04Mobile

            Just Internal.Width5 ->
                B.is05Mobile

            Just Internal.Width6 ->
                B.is06Mobile

            Just Internal.Width7 ->
                B.is07Mobile

            Just Internal.Width8 ->
                B.is08Mobile

            Just Internal.Width9 ->
                B.is09Mobile

            Just Internal.Width10 ->
                B.is10Mobile

            Just Internal.Width11 ->
                B.is11Mobile

            Nothing ->
                B.isNarrowMobile
        , case widths.tablet of
            Just Internal.Auto ->
                B.none

            Just Internal.Width1 ->
                B.is01Tablet

            Just Internal.Width2 ->
                B.is02Tablet

            Just Internal.Width3 ->
                B.is03Tablet

            Just Internal.Width4 ->
                B.is04Tablet

            Just Internal.Width5 ->
                B.is05Tablet

            Just Internal.Width6 ->
                B.is06Tablet

            Just Internal.Width7 ->
                B.is07Tablet

            Just Internal.Width8 ->
                B.is08Tablet

            Just Internal.Width9 ->
                B.is09Tablet

            Just Internal.Width10 ->
                B.is10Tablet

            Just Internal.Width11 ->
                B.is11Tablet

            Nothing ->
                B.isNarrowTablet
        , case widths.desktop of
            Just Internal.Auto ->
                B.none

            Just Internal.Width1 ->
                B.is01Desktop

            Just Internal.Width2 ->
                B.is02Desktop

            Just Internal.Width3 ->
                B.is03Desktop

            Just Internal.Width4 ->
                B.is04Desktop

            Just Internal.Width5 ->
                B.is05Desktop

            Just Internal.Width6 ->
                B.is06Desktop

            Just Internal.Width7 ->
                B.is07Desktop

            Just Internal.Width8 ->
                B.is08Desktop

            Just Internal.Width9 ->
                B.is09Desktop

            Just Internal.Width10 ->
                B.is10Desktop

            Just Internal.Width11 ->
                B.is11Desktop

            Nothing ->
                B.isNarrowDesktop
        , case widths.widescreen of
            Just Internal.Auto ->
                B.none

            Just Internal.Width1 ->
                B.is01Widescreen

            Just Internal.Width2 ->
                B.is02Widescreen

            Just Internal.Width3 ->
                B.is03Widescreen

            Just Internal.Width4 ->
                B.is04Widescreen

            Just Internal.Width5 ->
                B.is05Widescreen

            Just Internal.Width6 ->
                B.is06Widescreen

            Just Internal.Width7 ->
                B.is07Widescreen

            Just Internal.Width8 ->
                B.is08Widescreen

            Just Internal.Width9 ->
                B.is09Widescreen

            Just Internal.Width10 ->
                B.is10Widescreen

            Just Internal.Width11 ->
                B.is11Widescreen

            Nothing ->
                B.isNarrowWidescreen
        , case widths.fullHD of
            Just Internal.Auto ->
                B.none

            Just Internal.Width1 ->
                B.is01FullHD

            Just Internal.Width2 ->
                B.is02FullHD

            Just Internal.Width3 ->
                B.is03FullHD

            Just Internal.Width4 ->
                B.is04FullHD

            Just Internal.Width5 ->
                B.is05FullHD

            Just Internal.Width6 ->
                B.is06FullHD

            Just Internal.Width7 ->
                B.is07FullHD

            Just Internal.Width8 ->
                B.is08FullHD

            Just Internal.Width9 ->
                B.is09FullHD

            Just Internal.Width10 ->
                B.is10FullHD

            Just Internal.Width11 ->
                B.is11FullHD

            Nothing ->
                B.isNarrowFullHD
        , case offset of
            Internal.Auto ->
                B.none

            Internal.Width1 ->
                B.isOffset01

            Internal.Width2 ->
                B.isOffset02

            Internal.Width3 ->
                B.isOffset03

            Internal.Width4 ->
                B.isOffset04

            Internal.Width5 ->
                B.isOffset05

            Internal.Width6 ->
                B.isOffset06

            Internal.Width7 ->
                B.isOffset07

            Internal.Width8 ->
                B.isOffset08

            Internal.Width9 ->
                B.isOffset09

            Internal.Width10 ->
                B.isOffset10

            Internal.Width11 ->
                B.isOffset11
        ]



-- MODIFIERS --


{-| The `widths` field requires a `Maybe Width` for each device size.
`Nothing` will create a narrow column for that device range.
-}
type alias ColumnModifiers =
    { offset : M.Width
    , widths : M.Devices (Maybe M.Width)
    }


{-| Default offsets and widths for an individiual column.
The offset defaults to `Auto`. Each device defaults to `Just Auto`.
-}
columnModifiers : ColumnModifiers
columnModifiers =
    { offset = M.auto
    , widths =
        { mobile = Just M.auto
        , tablet = Just M.auto
        , desktop = Just M.auto
        , widescreen = Just M.auto
        , fullHD = Just M.auto
        }
    }


{-| Default offsets and widths for an individiual column.
The offset defaults to `Auto`. Each device defaults to `Nothing`.
-}
narrowColumnModifiers : ColumnModifiers
narrowColumnModifiers =
    { offset = M.auto
    , widths =
        { mobile = Nothing
        , tablet = Nothing
        , desktop = Nothing
        , widescreen = Nothing
        , fullHD = Nothing
        }
    }
