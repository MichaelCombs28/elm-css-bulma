module Bulma.Styled.Modifiers.Internal exposing
    ( Color(..)
    , Devices
    , Display(..)
    , HorizontalAlignment(..)
    , IsActive
    , Size(..)
    , State(..)
    , VerticalAlignment(..)
    , VerticalDirection(..)
    , Width(..)
    )

{-| -}


type Size
    = Small
    | Standard
    | Medium
    | Large


{-| -}
type Width
    = Auto
    | Width1
    | Width2
    | Width3
    | Width4
    | Width5
    | Width6
    | Width7
    | Width8
    | Width9
    | Width10
    | Width11


{-| -}
type State
    = Blur
    | Hover
    | Focus
    | Active
    | Loading


{-| -}
type Color
    = Default
    | White
    | Light
    | Dark
    | Black
    | Primary
    | Link
    | Info
    | Success
    | Warning
    | Danger


type HorizontalAlignment
    = Left
    | Centered
    | Right


type VerticalAlignment
    = Top
    | VerticallyCentered
    | Bottom


type VerticalDirection
    = Up
    | Down


type alias IsActive =
    Bool


type alias Devices a =
    { mobile : a
    , tablet : a
    , desktop : a
    , widescreen : a
    , fullHD : a
    }


type Display
    = Block
    | Flex
    | Hidden
    | Inline
    | InlineBlock
    | InlineFlex
