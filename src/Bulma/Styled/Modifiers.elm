module Bulma.Styled.Modifiers exposing
    ( Size, small, standard, medium, large
    , Width, width2, width3, width4, width5, width6, width7, width8, width9, width10, width11
    , State, blur, hover, focus, active, loading
    , IsActive
    , Color, default, white, light, dark, black, primary, link, info, success, warning, danger
    , HorizontalAlignment, left, centered, right
    , VerticalAlignment, top, bottom, verticallyCentered
    , VerticalDirection, up, down
    , clearfix
    , pulledLeft, pulledRight
    , overlay
    , fullWidth
    , marginless, paddingless
    , unselectable
    , clipped
    , radiusless, shadowless, invisible, screenReaderOnly
    , Devices, Display, block, flex, hidden, inline, inlineFlex
    , display, displayByDevice
    , auto, inlineBlock, width1
    )

{-| Most Bulma elements have alternative styles.
These types will come in handy for various modifiers records throughout this library.
Also included are a set of helpers for style, layout.


# Table of Contents

  - [Global Union Types](#types)
  - [Global Attributes](#attributes)
      - [General Helpers](#general)
      - [Display Helpers](#display)
      - [Typography Helpers](#typography)


# Types


## Size

@docs Size, small, standard, medium, large
@docs Width, auto width1, width2, width3, width4, width5, width6, width7, width8, width9, width10, width11


## State

@docs State, blur, hover, focus, active, loading
@docs IsActive


## Color

@docs Color, default, white, light, dark, black, primary, link, info, success, warning, danger


## Alignment

@docs HorizontalAlignment, left, centered, right
@docs VerticalAlignment, top, bottom, verticallyCentered


## Direction

@docs VerticalDirection, up, down


# Attributes


## General


### Float

@docs clearfix
@docs pulledLeft, pulledRight


### Overlay

@docs overlay


### Size


### Sizing

@docs fullWidth


### Spacing

@docs marginless, paddingless


### Selectability

@docs unselectable


### Overflow

@docs clipped


### Style

@docs radiusless, shadowless, invisible, screenReaderOnly


## Display

@docs Devices, Display, block, flex, hidden, inline, inelineBlock, inlineFlex
@docs display, displayByDevice


### Typography

See [Bulma.Modifiiers.Typography](http://package.elm-lang.org/packages/surprisetalk/elm-bulma/latest/Bulma-Modifiers-Typography).

-}

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Styled.Classes as B
import Bulma.Styled.Modifiers.Internal as Internal
import Html.Styled exposing (Attribute)
import Html.Styled.Attributes exposing (class)
import String exposing (join)


type alias Color =
    Internal.Color


{-| -}
default : Color
default =
    Internal.Default


{-| -}
white : Color
white =
    Internal.White


{-| -}
light : Color
light =
    Internal.Light


{-| -}
dark : Color
dark =
    Internal.Dark


{-| -}
black : Color
black =
    Internal.Black


{-| -}
primary : Color
primary =
    Internal.Primary


{-| -}
link : Color
link =
    Internal.Link


{-| -}
info : Color
info =
    Internal.Info


{-| -}
success : Color
success =
    Internal.Success


{-| -}
warning : Color
warning =
    Internal.Warning


{-| -}
danger : Color
danger =
    Internal.Danger


type alias Devices a =
    Internal.Devices a


type alias Display =
    Internal.Display


{-| -}
block : Display
block =
    Internal.Block


{-| -}
flex : Display
flex =
    Internal.Flex


{-| -}
hidden : Display
hidden =
    Internal.Hidden


{-| -}
inline : Display
inline =
    Internal.Inline


{-| -}
inlineBlock : Display
inlineBlock =
    Internal.InlineBlock


{-| -}
inlineFlex : Display
inlineFlex =
    Internal.InlineFlex


type alias HorizontalAlignment =
    Internal.HorizontalAlignment


{-| -}
left : HorizontalAlignment
left =
    Internal.Left


{-| -}
centered : HorizontalAlignment
centered =
    Internal.Centered


{-| -}
right : HorizontalAlignment
right =
    Internal.Right


type alias IsActive =
    Internal.IsActive


type alias Size =
    Internal.Size


{-| -}
small : Size
small =
    Internal.Small


{-| -}
standard : Size
standard =
    Internal.Standard


{-| -}
medium : Size
medium =
    Internal.Medium


{-| -}
large : Size
large =
    Internal.Large


type alias State =
    Internal.State


{-| -}
blur : State
blur =
    Internal.Blur


{-| -}
hover : State
hover =
    Internal.Hover


{-| -}
focus : State
focus =
    Internal.Focus


{-| -}
active : State
active =
    Internal.Active


{-| -}
loading : State
loading =
    Internal.Loading


type alias VerticalAlignment =
    Internal.VerticalAlignment


{-| -}
top : VerticalAlignment
top =
    Internal.Top


verticallyCentered : VerticalAlignment
verticallyCentered =
    Internal.VerticallyCentered


{-| -}
bottom : VerticalAlignment
bottom =
    Internal.Bottom


type alias VerticalDirection =
    Internal.VerticalDirection


{-| -}
up : VerticalDirection
up =
    Internal.Up


{-| -}
down : VerticalDirection
down =
    Internal.Down


type alias Width =
    Internal.Width


{-| -}
auto : Width
auto =
    Internal.Auto


{-| -}
width1 : Width
width1 =
    Internal.Width1


{-| -}
width2 : Width
width2 =
    Internal.Width2


{-| -}
width3 : Width
width3 =
    Internal.Width3


{-| -}
width4 : Width
width4 =
    Internal.Width4


{-| -}
width5 : Width
width5 =
    Internal.Width5


{-| -}
width6 : Width
width6 =
    Internal.Width6


{-| -}
width7 : Width
width7 =
    Internal.Width7


{-| -}
width8 : Width
width8 =
    Internal.Width8


{-| -}
width9 : Width
width9 =
    Internal.Width9


{-| -}
width10 : Width
width10 =
    Internal.Width10


{-| -}
width11 : Width
width11 =
    Internal.Width11



-- FLOAT -----------------------------------------------------------------------


{-| Fixes an element's floating children.
-}
clearfix : Attribute msg
clearfix =
    B.isClearfix


{-| Moves an element to the left.
-}
pulledLeft : Attribute msg
pulledLeft =
    B.isPulledLeft


{-| Moves an element to the right.
-}
pulledRight : Attribute msg
pulledRight =
    B.isPulledRight



-- INTERACTION -----------------------------------------------------------------


{-| Prevents text from being selectable.
-}
unselectable : Attribute msg
unselectable =
    B.isUnselectable



-- OVERLAY----------------------------------------------------------------------


{-| Completely covers the first-positioned parent.
-}
overlay : Attribute msg
overlay =
    B.isOverlay



-- SIZING ----------------------------------------------------------------------


{-| Takes up the whole width (100%).
-}
fullWidth : Attribute msg
fullWidth =
    B.isFullWidth



-- SPACING ---------------------------------------------------------------------


{-| Removes all margins.
-}
marginless : Attribute msg
marginless =
    B.isMarginless


{-| Removes all paddings.
-}
paddingless : Attribute msg
paddingless =
    B.isPaddingless



-- CLIPPED ---------------------------------------------------------------------


{-| Adds overflow:hidden.
-}
clipped : Attribute msg
clipped =
    B.isClipped



-- RADIUSLESS ------------------------------------------------------------------


{-| Removes any radius.
-}
radiusless : Attribute msg
radiusless =
    B.isRadiusless



-- SHADOWLESS ------------------------------------------------------------------


{-| Removes any shadow.
-}
shadowless : Attribute msg
shadowless =
    B.isShadowless



-- INVISIBLE -------------------------------------------------------------------


{-| Makes it disappear.
-}
invisible : Attribute msg
invisible =
    B.isInvisible


{-| Hides element visually, but keeps the element available to be announced by a screen reader.
-}
screenReaderOnly : Attribute msg
screenReaderOnly =
    B.isSROnly


{-| This sets a certain display attributes across all device sizes.
-}
display : Display -> Attribute msg
display d =
    case d of
        Internal.Block ->
            B.isBlock

        Internal.Flex ->
            B.isFlex

        Internal.Inline ->
            B.isInline

        Internal.InlineBlock ->
            B.isInlineBlock

        Internal.InlineFlex ->
            B.isInlineFlex

        Internal.Hidden ->
            B.isHidden


{-| This sets display attributes per-device.

    tabletOnly =
        displayByDevice
            { mobile = Hidden
            , tablet = Block
            , desktop = Hidden
            , widescreen = Hidden
            , fullHD = Hidden
            }

-}
displayByDevice : Devices Display -> Attribute msg
displayByDevice { mobile, tablet, desktop, widescreen, fullHD } =
    class <|
        join " "
            [ case mobile of
                Internal.Block ->
                    "is-block-mobile"

                Internal.Flex ->
                    "is-flex-mobile"

                Internal.Inline ->
                    "is-inline-mobile"

                Internal.InlineBlock ->
                    "is-inline-block-mobile"

                Internal.InlineFlex ->
                    "is-inline-flex-mobile"

                Internal.Hidden ->
                    "is-hidden-mobile"
            , case tablet of
                Internal.Block ->
                    "is-block-tablet-only"

                Internal.Flex ->
                    "is-flex-tablet-only"

                Internal.Inline ->
                    "is-inline-tablet-only"

                Internal.InlineBlock ->
                    "is-inline-block-tablet-only"

                Internal.InlineFlex ->
                    "is-inline-flex-tablet-only"

                Internal.Hidden ->
                    "is-hidden-tablet-only"
            , case desktop of
                Internal.Block ->
                    "is-block-desktop-only"

                Internal.Flex ->
                    "is-flex-desktop-only"

                Internal.Inline ->
                    "is-inline-desktop-only"

                Internal.InlineBlock ->
                    "is-inline-block-desktop-only"

                Internal.InlineFlex ->
                    "is-inline-flex-desktop-only"

                Internal.Hidden ->
                    "is-hidden-desktop-only"
            , case widescreen of
                Internal.Block ->
                    "is-block-widescreen-only"

                Internal.Flex ->
                    "is-flex-widescreen-only"

                Internal.Inline ->
                    "is-inline-widescreen-only"

                Internal.InlineBlock ->
                    "is-inline-block-widescreen-only"

                Internal.InlineFlex ->
                    "is-inline-flex-widescreen-only"

                Internal.Hidden ->
                    "is-hidden-widescreen-only"

            -- KLUDGE: add widescreen helpers to BulmaClasses
            , case fullHD of
                Internal.Block ->
                    "is-block-fullHD-only"

                Internal.Flex ->
                    "is-flex-fullHD-only"

                Internal.Inline ->
                    "is-inline-fullHD-only"

                Internal.InlineBlock ->
                    "is-inline-block-fullHD-only"

                Internal.InlineFlex ->
                    "is-inline-flex-fullHD-only"

                Internal.Hidden ->
                    "is-hidden-fullHD"

            -- KLUDGE: add fullHD helpers to BulmaClasses
            ]
