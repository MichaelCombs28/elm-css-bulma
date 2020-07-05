module Bulma.Styled.CDN exposing (stylesheet)

{-|

@docs stylesheet

-}

import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as HtmlAttributes


{-| Include Bulma 0.7.0 in your Elm project.

    import Bulma.CDN exposing (stylesheet)

    view : Model -> Html msg
    view model =
        div []
            [ stylesheet
            , text "wow!"
            ]

-}
stylesheet : Html msg
stylesheet =
    Html.node "link"
        [ HtmlAttributes.rel "stylesheet"
        , HtmlAttributes.href "https://cdn.jsdelivr.net/npm/bulma@0.7.0/css/bulma.min.css"
        ]
        []
