module Bulma.Styled.Elements exposing
    ( Box
    , box
    , Button, ButtonModifiers, buttonModifiers
    , button, easyButton
    , buttons, connectedButtons
    , Content
    , content
    , Delete
    , delete, easyDelete
    , Icon, IconBody
    , icon
    , Image, ImageSize, x16, x24, x32, x48, x64, x96, x128, unbounded, ImageShape, natural, oneByOne, fourByThree, threeByTwo, sixteenByNine, twoByOne
    , image, easyImage, easyPlaceholderImage
    , Notification
    , notification, notificationWithDelete
    , Progress, ProgressModifiers, progressModifiers
    , progress, easyProgress
    , Table, TableModifiers, tableModifiers
    , table
    , TablePartition
    , tableBody, tableHead, tableFoot
    , TableRow, IsHighlighted
    , tableRow
    , TableCell
    , tableCell, tableCellHead
    , Tag, TagModifiers, tagModifiers
    , tag, easyTag, deleteTag
    , roundedTag, easyRoundedTag
    , tagWithDelete, easyTagWithDelete, easyRoundedTagWithDelete
    , tags
    , multitag
    , Title, TitleSize, h1, h2, h3, h4, h5, h6
    , title, subtitle
    , TitleSpacing
    , easyTitleWithSubtitle
    )

{-|


# Table of Contents

  - [Box](#box)
  - [Button](#button)
  - [Content](#content)
  - [Delete](#delete)
  - [Icon](#icon)
  - [Image](#image)
  - [Notification](#notification)
  - [Progress](#progress)
  - [Table](#table)
  - [Tag](#tag)
  - [Title](#title)


# Box

@docs Box
@docs box


# Button

@docs Button, ButtonModifiers, buttonModifiers
@docs button, easyButton
@docs buttons, connectedButtons


# Content

@docs Content
@docs content


# Delete

@docs Delete
@docs delete, easyDelete


# Icon

@docs Icon, IconBody
@docs icon


# Image

@docs Image, ImageSize, x16, x24, x32, x48, x64, x96, x128, unbounded, ImageShape, natural, oneByOne, fourByThree, threeByTwo, sixteenByNine, twoByOne
@docs image, easyImage, easyPlaceholderImage


# Notification

@docs Notification
@docs notification, notificationWithDelete


# Progress

@docs Progress, ProgressModifiers, progressModifiers
@docs progress, easyProgress


# Table

@docs Table, TableModifiers, tableModifiers
@docs table


## Table Partition

@docs TablePartition
@docs tableBody, tableHead, tableFoot


### Table Row

@docs TableRow, IsHighlighted
@docs tableRow


#### Table Cell

@docs TableCell
@docs tableCell, tableCellHead


# Tag

@docs Tag, TagModifiers, tagModifiers
@docs tag, easyTag, deleteTag
@docs roundedTag, easyRoundedTag
@docs tagWithDelete, easyTagWithDelete, easyRoundedTagWithDelete


## Tags

@docs tags
@docs multitag


# Title

@docs Title, TitleSize, h1, h2, h3, h4, h5, h6
@docs title, subtitle


## Title Pair

@docs TitleSpacing
@docs easyTitleWithSubtitle

-}

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Styled.Classes as B
import Bulma.Styled.Helpers exposing (..)
import Bulma.Styled.Modifiers as M
import Bulma.Styled.Modifiers.Internal as Internal
import Html.Styled exposing (Attribute, Html, a, div, img, span, text)
import Html.Styled.Attributes as Attr exposing (class)
import Html.Styled.Events exposing (onClick)
import List exposing (filter)



-- BOX -------------------------------------------------------------------------


{-| -}
type alias Box msg =
    Html msg


{-| A white box to contain other elements.
The box is simply a container with a shadow, a border, a radius, and some padding.

    myBox : Html msg
    myBox =
        box []
            [ p []
                [ text "I'm the box ghost!" ]
            ]

-}
box : List (Attribute msg) -> List (Html msg) -> Box msg
box =
    node "div" [ B.box ]



-- BUTTON ----------------------------------------------------------------------
-- TODO: iconButton


{-| -}
type alias Button msg =
    Html msg


{-|

    type Msg
        = DoSomething
        | DoSomethingElse

    myButton : Html Msg
    myButton =
        button myButtonModifiers
            [ onClick DoSomething ]
            [ text "Click me!" ]

    myIconButton : Html Msg
    myIconButton =
        button myButtonModifiers
            [ onClick DoSomething ]
            [ icon [] [ Bulm.Elements.Icon.star ]
            , span [] [ text "No, click me!" ]
            ]

-}
button : ButtonModifiers msg -> List (Attribute msg) -> List (Html msg) -> Button msg
button { disabled, outlined, inverted, rounded, size, state, color, static, iconLeft, iconRight } attrs htmls =
    let
        htmls_ : List (Html msg)
        htmls_ =
            case htmls of
                [] ->
                    iconLeft_ ++ iconRight_

                htmls__ ->
                    iconLeft_ ++ [ span [] htmls__ ] ++ iconRight_

        iconLeft_ : List (Html msg)
        iconLeft_ =
            case iconLeft of
                Just ( size_, attrs_, body ) ->
                    [ icon size_ attrs_ [ body ] ]

                Nothing ->
                    []

        iconRight_ : List (Html msg)
        iconRight_ =
            case iconRight of
                Just ( size_, attrs_, body ) ->
                    [ icon size_ attrs_ [ body ] ]

                Nothing ->
                    []
    in
    node "a"
        [ Attr.disabled disabled
        , B.button
        , case static of
            True ->
                B.isStatic

            False ->
                B.none
        , case outlined of
            True ->
                B.isOutlined

            False ->
                B.none
        , case inverted of
            True ->
                B.isInverted

            False ->
                B.none
        , case rounded of
            True ->
                B.isRounded

            False ->
                B.none
        , case color of
            Internal.Default ->
                B.none

            _ ->
                B.isSelected
        , case color of
            Internal.Default ->
                B.none

            Internal.White ->
                B.isWhite

            Internal.Light ->
                B.isLight

            Internal.Dark ->
                B.isDark

            Internal.Black ->
                B.isBlack

            Internal.Primary ->
                B.isPrimary

            Internal.Link ->
                B.isLink

            Internal.Info ->
                B.isInfo

            Internal.Success ->
                B.isSuccess

            Internal.Warning ->
                B.isWarning

            Internal.Danger ->
                B.isDanger
        , case size of
            Internal.Small ->
                B.isSmall

            Internal.Standard ->
                B.none

            Internal.Medium ->
                B.isMedium

            Internal.Large ->
                B.isLarge
        , case state of
            Internal.Blur ->
                B.none

            Internal.Hover ->
                B.isHovered

            Internal.Focus ->
                B.isFocused

            Internal.Active ->
                B.isActive

            Internal.Loading ->
                B.isLoading
        ]
        attrs
        htmls_


{-|

    type Msg
        = DoSomething
        | DoSomethingElse

    myEasyButton : Html Msg
    myEasyButton =
        easyButton myButtonModifiers
            []
            DoSomethingElse
            "Click me!"

-}
easyButton : ButtonModifiers msg -> List (Attribute msg) -> msg -> String -> Button msg
easyButton mods attrs msg str =
    button mods
        (onClick msg :: attrs)
        [ text str ]



-- BUTTON LIST --


{-|

    myButtons : Html Msg
    myButtons =
        buttons Left
            []
            [ button { buttonModifiers | color = Success } [ text "Save changes" ]
            , button { buttonModifiers | color = Primary } [ text "Save and continue" ]
            , button { buttonModifiers | color = Danger } [ text "Cancel" ]
            ]

-}
buttons : M.HorizontalAlignment -> List (Attribute msg) -> List (Button msg) -> Html msg
buttons alignment =
    node "div"
        [ B.buttons
        , case alignment of
            Internal.Left ->
                B.none

            Internal.Centered ->
                B.isCentered

            Internal.Right ->
                B.isRight
        ]


{-|

    myConnectedButtons : Html Msg
    myConnectedButtons =
        connectedButtons Left
            []
            [ button buttonModifiers [ text "Yes" ]
            , button { buttonModifiers | color = Primary } [ text "Maybe" ]
            , button buttonModifiers [ text "No" ]
            ]

-}
connectedButtons : M.HorizontalAlignment -> List (Attribute msg) -> List (Button msg) -> Html msg
connectedButtons alignment =
    buttons alignment << (::) (class "has-addons")



-- MODIFIERS --


{-| -}
type alias ButtonModifiers msg =
    { disabled : Bool
    , outlined : Bool
    , inverted : Bool
    , rounded : Bool
    , static : Bool
    , size : M.Size
    , state : M.State
    , color : M.Color
    , iconLeft : Maybe ( M.Size, List (Attribute msg), IconBody msg )
    , iconRight : Maybe ( M.Size, List (Attribute msg), IconBody msg )
    }


{-| The basic defaults for buttons.

    import Bulma.Modifiers
        exposing
            ( Color(Default)
            , Size(Standard)
            , State(Blur)
            )

    myButtonModifiers : ButtonModifiers msg
    myButtonModifiers =
        { disabled = False
        , outlined = False
        , inverted = False
        , size = Standard
        , state = Blur
        , color = Default
        }

-}
buttonModifiers : ButtonModifiers msg
buttonModifiers =
    { disabled = False
    , outlined = False
    , inverted = False
    , rounded = False
    , static = False
    , size = M.standard
    , state = M.blur
    , color = M.default
    , iconLeft = Nothing
    , iconRight = Nothing
    }



-- CONTENT ---------------------------------------------------------------------


{-| -}
type alias Content msg =
    Html msg


{-| A single class to handle WYSIWYG-generated content, where only HTML tags are available.

    import Bulma.Modifiers exposing (Size(Standard))

    myContent : Html msg
    myContent =
        content Standard
            []
            [ p [] [ text "Lorem ipsum..." ]
            ]

It can handle almost any HTML element, including:

  - `p`
  - `ul` / `ol` / `dl`
  - `h1` through `h6`
  - `blockquote`
  - `em` & `strong`
  - `table`, `tr`, `th`, and `td` tables

-}
content : M.Size -> List (Attribute msg) -> List (Html msg) -> Content msg
content size =
    node "div"
        [ B.content
        , case size of
            Internal.Small ->
                B.isSmall

            Internal.Standard ->
                B.none

            Internal.Medium ->
                B.isMedium

            Internal.Large ->
                B.isLarge
        ]



-- DELETE ----------------------------------------------------------------------


{-| -}
type alias Delete msg =
    Html msg


{-| Versatile delete cross.
-}
delete : List (Attribute msg) -> List (Html msg) -> Delete msg
delete =
    node "a" [ B.delete ]


{-|

    type Msg
        = DeleteMsg

    myEasyDelete : Html Msg
    myEasyDelete =
        easyDelete [] DeleteMsg

-}
easyDelete : List (Attribute msg) -> msg -> Delete msg
easyDelete attrs msg =
    delete (onClick msg :: attrs) []



-- ICON ------------------------------------------------------------------------


{-| -}
type alias Icon msg =
    Html msg


{-| import Icon.FontAwesome exposing ( fontAwesomeCDN, meh\_o )
-- see <http://package.elm-lang.org/packages/surprisetalk/elm-icon/latest>

    import Bulma.Modifiers exposing (Size(Large))

    view : Model -> Html msg
    view model =
        div []
            [ fontAwesomeCDN
            , icon Large [] [ meh_o ]
            , icon Large [] [ i [ class "fas fa-meh-o" ] [] ]
            ]

-}
icon : M.Size -> List (Attribute msg) -> List (IconBody msg) -> Icon msg
icon size =
    node "span"
        [ B.icon
        , case size of
            Internal.Small ->
                B.isSmall

            Internal.Standard ->
                B.none

            Internal.Medium ->
                B.isMedium

            Internal.Large ->
                B.isLarge
        ]


{-| -}
type alias IconBody msg =
    Html msg



-- IMAGE -----------------------------------------------------------------------


{-| -}
type alias Image msg =
    Html msg


{-| -}
type ImageShape
    = Natural
    | OneByOne ImageSize
    | FourByThree
    | ThreeByTwo
    | SixteenByNine
    | TwoByOne


{-| -}
natural : ImageShape
natural =
    Natural


{-| -}
oneByOne : ImageSize -> ImageShape
oneByOne =
    OneByOne


{-| -}
fourByThree : ImageShape
fourByThree =
    FourByThree


{-| -}
threeByTwo : ImageShape
threeByTwo =
    ThreeByTwo


{-| -}
sixteenByNine : ImageShape
sixteenByNine =
    SixteenByNine


{-| -}
twoByOne : ImageShape
twoByOne =
    TwoByOne


{-| -}
type ImageSize
    = X16
    | X24
    | X32
    | X48
    | X64
    | X96
    | X128
    | Unbounded


{-| -}
x16 : ImageSize
x16 =
    X16


{-| -}
x24 : ImageSize
x24 =
    X24


{-| -}
x32 : ImageSize
x32 =
    X32


{-| -}
x48 : ImageSize
x48 =
    X48


{-| -}
x64 : ImageSize
x64 =
    X64


{-| -}
x96 : ImageSize
x96 =
    X96


{-| -}
x128 : ImageSize
x128 =
    X128


{-| -}
unbounded : ImageSize
unbounded =
    Unbounded


{-| Use the `image` container to specify a precisely-sized container so that your layout isn't broken because of loading or broken images.

    myImage : Html msg
    myImage =
        image FourByThree
            []
            [ img [ src "https://i.imgur.com/pPjvmVS.jpg" ] []
            ]

-}
image : ImageShape -> List (Attribute msg) -> List (Html msg) -> Image msg
image shape =
    node "figure"
        [ B.image
        , case shape of
            OneByOne Unbounded ->
                B.is1by1

            OneByOne X16 ->
                B.is16x16

            OneByOne X24 ->
                B.is24x24

            OneByOne X32 ->
                B.is32x32

            OneByOne X48 ->
                B.is48x48

            OneByOne X64 ->
                B.is64x64

            OneByOne X96 ->
                B.is96x96

            OneByOne X128 ->
                B.is128x128

            FourByThree ->
                B.is4by3

            ThreeByTwo ->
                B.is3by2

            SixteenByNine ->
                B.is16by9

            TwoByOne ->
                B.is2by1

            Natural ->
                B.none
        ]



-- TODO: roundedImage


{-|

    myEasyImage : Html msg
    myEasyImage =
        easyImage Natural
            []
            "http://i.imgur.com/I47PSAO.png"

-}
easyImage : ImageShape -> List (Attribute msg) -> String -> Image msg
easyImage mods attrs src =
    image mods attrs [ img [ Attr.src src ] [] ]


{-| This is a quick and dirty way to make placeholder images, using sources like <http://bulma.io/images/placeholders/16x16.png> .

    -- OneByOne X16       ->  16 X  16
    -- OneByOne X24       ->  24 X  24
    -- OneByOne X32       ->  32 X  32
    -- OneByOne X48       ->  48 X  48
    -- OneByOne X64       ->  64 X  64
    -- OneByOne X96       ->  96 X  96
    -- OneByOne X128      -> 128 X 128
    -- OneByOne Unbounded -> 256 X 256
    -- FourByThree        -> 640 X 480
    -- ThreeByTwo         -> 480 X 320
    -- SixteenByNine      -> 640 X 360
    -- TwoByOne           -> 640 X 320
    -- _                  -> 256 X 256
    myEasyPlaceholderImage : Html msg
    myEasyPlaceholderImage =
        easyPlaceholderImage (OneByOne Unbounded) []

-}
easyPlaceholderImage : ImageShape -> List (Attribute msg) -> Image msg
easyPlaceholderImage shape attrs =
    image shape
        attrs
        [ flip img
            []
            [ Attr.src <|
                (\( h, w ) -> "http://bulma.io/images/placeholders/" ++ String.fromInt h ++ "x" ++ String.fromInt w ++ ".png") <|
                    case shape of
                        OneByOne X16 ->
                            ( 16, 16 )

                        OneByOne X24 ->
                            ( 24, 24 )

                        OneByOne X32 ->
                            ( 32, 32 )

                        OneByOne X48 ->
                            ( 48, 48 )

                        OneByOne X64 ->
                            ( 64, 64 )

                        OneByOne X96 ->
                            ( 96, 96 )

                        OneByOne X128 ->
                            ( 128, 128 )

                        OneByOne Unbounded ->
                            ( 256, 256 )

                        FourByThree ->
                            ( 640, 480 )

                        ThreeByTwo ->
                            ( 480, 320 )

                        SixteenByNine ->
                            ( 640, 360 )

                        TwoByOne ->
                            ( 640, 320 )

                        _ ->
                            ( 256, 256 )
            ]
        ]



-- NOTIFICATION ----------------------------------------------------------------


{-| -}
type alias Notification msg =
    Html msg


{-|

    import Bulma.Modifiers exposing (Color(Danger))

    myNotification : Html msg
    myNotification =
        notification Danger
            []
            [ text "Something went wrong!"
            ]

-}
notification : M.Color -> List (Attribute msg) -> List (Html msg) -> Notification msg
notification color =
    node "div"
        [ B.notification
        , case color of
            Internal.Default ->
                B.none

            Internal.White ->
                B.isWhite

            Internal.Light ->
                B.isLight

            Internal.Dark ->
                B.isDark

            Internal.Black ->
                B.isBlack

            Internal.Primary ->
                B.isPrimary

            Internal.Info ->
                B.isInfo

            Internal.Success ->
                B.isSuccess

            Internal.Warning ->
                B.isWarning

            Internal.Danger ->
                B.isDanger

            Internal.Link ->
                B.isLink
        ]


{-|

    import Bulma.Modifiers exposing (Color(Success))

    type Msg
        = ClearNotificationsMsg

    myNotification : Html Msg
    myNotification =
        notificationWithDelete Danger
            []
            ClearNotificationsMsg
            [ text "Something went right!"
            ]

-}
notificationWithDelete : M.Color -> List (Attribute msg) -> msg -> List (Html msg) -> Notification msg
notificationWithDelete color attrs msg =
    notification color attrs << (::) (easyDelete [] msg)



-- PROGRESS --------------------------------------------------------------------


{-| -}
type alias Progress msg =
    Html msg


{-| -}
type alias ProgressModifiers =
    { size : M.Size
    , color : M.Color
    }


{-| -}
progressModifiers : ProgressModifiers
progressModifiers =
    { size = M.standard
    , color = M.default
    }


{-|

    myProgressBar : Int -> Int -> Html msg
    myProgressBar pVal pMax =
        progress myProgressModifiers
            [ value <| toString pVal
            , max <| toString pMax
            ]
            []

-}
progress : ProgressModifiers -> List (Attribute msg) -> List (Html msg) -> Progress msg
progress { size, color } =
    node "progress"
        [ B.progress
        , case size of
            Internal.Small ->
                B.isSmall

            Internal.Standard ->
                B.none

            Internal.Medium ->
                B.isMedium

            Internal.Large ->
                B.isLarge
        , case color of
            Internal.Default ->
                B.none

            Internal.White ->
                B.isWhite

            Internal.Light ->
                B.isLight

            Internal.Dark ->
                B.isDark

            Internal.Black ->
                B.isBlack

            Internal.Primary ->
                B.isPrimary

            Internal.Info ->
                B.isInfo

            Internal.Success ->
                B.isSuccess

            Internal.Warning ->
                B.isWarning

            Internal.Danger ->
                B.isDanger

            Internal.Link ->
                B.isLink
        ]


{-|

    myProgressBar : Float -> Html msg
    myProgressBar percentCompleted =
        progress myProgressModifiers
            []
            percentCompleted

-}
easyProgress : ProgressModifiers -> List (Attribute msg) -> Float -> Progress msg
easyProgress mods attrs val =
    progress mods (Attr.value (String.fromInt (round (val * 100))) :: (Attr.max "100" :: attrs)) []



-- TABLE -----------------------------------------------------------------------


{-| -}
type alias Table msg =
    Html msg


{-| -}
type alias TableModifiers =
    { bordered : Bool
    , striped : Bool
    , narrow : Bool
    , hoverable : Bool
    , fullWidth : Bool
    }


{-| -}
tableModifiers : TableModifiers
tableModifiers =
    { bordered = False
    , striped = False
    , narrow = False
    , hoverable = False
    , fullWidth = False
    }


{-|

    myTable : Html msg
    myTable =
        table myTableModifiers
            []
            [ tableHead [] []
            , tableBody [] []
            , tableFoot [] []
            ]

-}
table : TableModifiers -> List (Attribute msg) -> List (TablePartition msg) -> Table msg
table { bordered, striped, narrow, hoverable, fullWidth } =
    node "table"
        [ B.table
        , case bordered of
            True ->
                B.isBordered

            False ->
                B.none
        , case striped of
            True ->
                B.isStriped

            False ->
                B.none
        , case narrow of
            True ->
                B.isNarrow

            False ->
                B.none
        , case hoverable of
            True ->
                B.isHoverable

            False ->
                B.none
        , case fullWidth of
            True ->
                B.isFullWidth

            False ->
                B.none
        ]



-- TABLE PARTITIONS --


{-| -}
type alias TablePartition msg =
    Html msg


{-|

    myTableHead : Html msg
    myTableHead =
        tableHead []
            [ tableRow False
                []
                [ tableCellHead [] []
                , tableCellHead [] []
                , tableCellHead [] []
                ]
            ]

-}
tableHead : List (Attribute msg) -> List (TableRow msg) -> TablePartition msg
tableHead =
    node "thead" []


{-|

    myTableBody : Html msg
    myTableBody =
        tableBody []
            [ tableRow False
                []
                [ tableCell [] []
                , tableCell [] []
                , tableCell [] []
                ]
            , tableRow True
                []
                [ tableCell [] []
                , tableCell [] []
                , tableCell [] []
                ]
            ]

-}
tableBody : List (Attribute msg) -> List (TableRow msg) -> TablePartition msg
tableBody =
    node "tbody" []


{-|

    myTableFoot : Html msg
    myTableFoot =
        tableFoot []
            [ tableRow False
                []
                [ tableCellHead [] []
                , tableCellHead [] []
                , tableCellHead [] []
                ]
            ]

-}
tableFoot : List (Attribute msg) -> List (TableRow msg) -> TablePartition msg
tableFoot =
    node "tfoot" []



-- TABLE ROW --


{-| -}
type alias TableRow msg =
    Html msg


{-| -}
type alias IsHighlighted =
    Bool


{-| -}
tableRow : IsHighlighted -> List (Attribute msg) -> List (TableCell msg) -> TableRow msg
tableRow highlighted =
    node "tr"
        [ case highlighted of
            True ->
                B.isSelected

            False ->
                B.none
        ]



-- TABLE CELLS --


{-| -}
type alias TableCell msg =
    Html msg


{-| -}
tableCell : List (Attribute msg) -> List (Html msg) -> TableCell msg
tableCell =
    node "td" []


{-| -}
tableCellHead : List (Attribute msg) -> List (Html msg) -> TableCell msg
tableCellHead =
    node "th" []



-- TAG -------------------------------------------------------------------------


{-| -}
type alias Tag msg =
    Html msg


{-| -}
type alias TagModifiers =
    { size : M.Size
    , color : M.Color
    , isLink : Bool
    }


{-| -}
tagModifiers : TagModifiers
tagModifiers =
    { size = M.standard
    , color = M.default
    , isLink = False
    }


{-|

    myTag : Html msg
    myTag =
        tag myTagModifiers
            []
            [ text "Hip to Be Square"
            ]

-}
tag : TagModifiers -> List (Attribute msg) -> List (Html msg) -> Tag msg
tag { size, color, isLink } =
    node
        (if isLink then
            "a"

         else
            "span"
        )
        [ B.tag

        -- , case isLink of
        --     True  -> B.isLink
        --     False -> B.none
        , case size of
            Internal.Small ->
                B.none

            -- KLUDGE
            Internal.Standard ->
                B.none

            Internal.Medium ->
                B.isMedium

            Internal.Large ->
                B.isLarge
        , case color of
            Internal.Default ->
                B.none

            Internal.White ->
                B.isWhite

            Internal.Light ->
                B.isLight

            Internal.Dark ->
                B.isDark

            Internal.Black ->
                B.isBlack

            Internal.Primary ->
                B.isPrimary

            Internal.Info ->
                B.isInfo

            Internal.Success ->
                B.isSuccess

            Internal.Warning ->
                B.isWarning

            Internal.Danger ->
                B.isDanger

            Internal.Link ->
                B.isLink
        ]


{-|

    myTag : Html msg
    myTag =
        roundedTag myTagModifiers
            []
            [ text "Behold! I'm circlular!"
            ]

-}
roundedTag : TagModifiers -> List (Attribute msg) -> List (Html msg) -> Tag msg
roundedTag mods attrs =
    tag mods <| B.isRounded :: attrs


{-|

    myTag : Html msg
    myTag =
        easyTag myTagModifiers
            []
            "That was easy."

-}
easyTag : TagModifiers -> List (Attribute msg) -> String -> Tag msg
easyTag mods attrs =
    text >> ls >> tag mods attrs


{-|

    myMultitag : Html msg
    myMultitag =
        multitag []
            [ myMainTag
            , myDeleteTag
            ]

    myDeleteTag : Html msg
    myDeleteTag =
        deleteTag myTagModifiers
            [ onClick DeleteTag ]
            "Delete me!"

-}
deleteTag : TagModifiers -> List (Attribute msg) -> List (Html msg) -> Tag msg
deleteTag { size, color } =
    node "a"
        [ B.tag
        , B.isDelete
        , case size of
            Internal.Small ->
                B.none

            -- KLUDGE
            Internal.Standard ->
                B.none

            Internal.Medium ->
                B.isMedium

            Internal.Large ->
                B.isLarge
        , case color of
            Internal.Default ->
                B.none

            Internal.White ->
                B.isWhite

            Internal.Light ->
                B.isLight

            Internal.Dark ->
                B.isDark

            Internal.Black ->
                B.isBlack

            Internal.Primary ->
                B.isPrimary

            Internal.Info ->
                B.isInfo

            Internal.Success ->
                B.isSuccess

            Internal.Warning ->
                B.isWarning

            Internal.Danger ->
                B.isDanger

            Internal.Link ->
                B.isLink
        ]


{-| -}
easyRoundedTag : TagModifiers -> List (Attribute msg) -> String -> Tag msg
easyRoundedTag mods attrs =
    text >> ls >> roundedTag mods attrs


{-|

    type Msg
        = DeleteTag Id

    myTag : Id -> Html Msg
    myTag id =
        tagWithDelete myTagModifiers
            []
            (DeleteTag id)
            [ text "cool"
            ]

-}
tagWithDelete : TagModifiers -> List (Attribute msg) -> msg -> List (Html msg) -> Tag msg
tagWithDelete mods attrs msg =
    flip (++) [ easyDelete [] msg ] >> tag mods attrs


{-|

    type Msg
        = DeleteTag Id

    myTag : Id -> Html Msg
    myTag id =
        tagWithDelete myTagModifiers
            []
            (DeleteTag id)
            "cooler"

-}
easyTagWithDelete : TagModifiers -> List (Attribute msg) -> msg -> String -> Tag msg
easyTagWithDelete mods attrs msg str =
    tag mods attrs [ text str, easyDelete [] msg ]


{-| -}
easyRoundedTagWithDelete : TagModifiers -> List (Attribute msg) -> msg -> String -> Tag msg
easyRoundedTagWithDelete mods attrs msg str =
    roundedTag mods attrs [ text str, easyDelete [] msg ]



-- TAG GROUPS --


{-|

    myTags : Html msg
    myTags =
        tags []
            [ myFirstTag
            , mySecondTag
            ]

-}
tags : List (Attribute msg) -> List (Tag msg) -> Html msg
tags =
    node "div" [ B.tags ]


{-|

    myMultitag : Html msg
    myMultitag =
        multitag []
            [ myFirstTag
            , mySecondTag
            ]

    myMultitags : Html msg
    myMultitags =
        multilineFields []
            [ control myControlModifiers
                []
                [ myMultiTag
                ]
            , control myControlModifiers
                []
                [ myMultiTag
                ]
            , control myControlModifiers
                []
                [ myMultiTag
                ]
            ]

-}
multitag : List (Attribute msg) -> List (Tag msg) -> Html msg
multitag =
    node "div" [ B.tags, B.hasAddons ]



-- TODO: multi-multitags with field.is-grouped.is-grouped-multiline < control
-- TITLE -----------------------------------------------------------------------


{-| -}
type alias Title msg =
    Html msg


{-| -}
type TitleSize
    = H1
    | H2
    | H3
    | H4
    | H5
    | H6


{-| -}
h1 : TitleSize
h1 =
    H1


{-| -}
h2 : TitleSize
h2 =
    H2


{-| -}
h3 : TitleSize
h3 =
    H3


{-| -}
h4 : TitleSize
h4 =
    H4


{-| -}
h5 : TitleSize
h5 =
    H5


{-| -}
h6 : TitleSize
h6 =
    H6


{-|

    myTitle : Html msg
    myTitle =
        title H1
            []
            [ text "Hullo"
            ]

-}
title : TitleSize -> List (Attribute msg) -> List (Html msg) -> Title msg
title size =
    node
        (case size of
            H1 ->
                "h1"

            H2 ->
                "h2"

            H3 ->
                "h3"

            H4 ->
                "h4"

            H5 ->
                "h5"

            H6 ->
                "h6"
        )
        [ B.title
        , case size of
            H1 ->
                B.is1

            H2 ->
                B.is2

            H3 ->
                B.is3

            H4 ->
                B.is4

            H5 ->
                B.is5

            H6 ->
                B.is6
        ]



-- SUBTITLE --


{-|

    mySubtitle : Html msg
    mySubtitle =
        subtitle H3
            []
            [ text "World"
            ]

-}
subtitle : TitleSize -> List (Attribute msg) -> List (Html msg) -> Title msg
subtitle size =
    node
        (case size of
            H1 ->
                "h1"

            H2 ->
                "h2"

            H3 ->
                "h3"

            H4 ->
                "h4"

            H5 ->
                "h5"

            H6 ->
                "h6"
        )
        [ B.subtitle
        , case size of
            H1 ->
                B.is1

            H2 ->
                B.is2

            H3 ->
                B.is3

            H4 ->
                B.is4

            H5 ->
                B.is5

            H6 ->
                B.is6
        ]



-- TITLE PAIR --


{-| -}
type alias TitleSpacing =
    Bool


{-|

    myTitle : Html msg
    myTitle =
        easyTitleWithSubtitle False
            H1
            [ text "EPISODE V" ]
            [ text "THE EMPIRE STRIKES BACK" ]

-}
easyTitleWithSubtitle : TitleSpacing -> TitleSize -> List (Html msg) -> List (Html msg) -> List (Title msg)
easyTitleWithSubtitle spacing size title_ subt =
    [ node "p"
        [ B.title
        , case spacing of
            True ->
                B.isNormal

            False ->
                B.none
        , case size of
            H1 ->
                B.is1

            H2 ->
                B.is2

            H3 ->
                B.is3

            H4 ->
                B.is4

            H5 ->
                B.is5

            H6 ->
                B.is6
        ]
        []
        title_
    , node "p"
        [ B.subtitle
        , case size of
            H1 ->
                B.is3

            H2 ->
                B.is4

            H3 ->
                B.is5

            _ ->
                B.is6
        ]
        []
        subt
    ]
