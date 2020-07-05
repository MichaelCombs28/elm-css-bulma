module Example exposing (..)

import Browser
import Bulma.Styled.CDN exposing (..)
import Bulma.Styled.Columns as Columns exposing (..)
import Bulma.Styled.Components exposing (..)
import Bulma.Styled.Elements exposing (..)
import Bulma.Styled.Form exposing (..)
import Bulma.Styled.Layout exposing (..)
import Bulma.Styled.Modifiers exposing (..)
import Bulma.Styled.Modifiers.Typography exposing (textCentered)
import Html.Styled as Html exposing (Attribute, Html, a, br, i, img, input, main_, option, p, span, strong, text)
import Html.Styled.Attributes exposing (attribute, class, href, placeholder, rel, src, style, type_)


type alias Model =
    {}


type Msg
    = NoOp


main : Program () Model Msg
main =
    Browser.sandbox
        { init = {}
        , view = view >> Html.toUnstyled
        , update = \msg -> \model -> model
        }


fontAwesomeCDN =
    Html.node "link"
        [ rel "stylesheet"
        , href "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        ]
        []


view : Model -> Html Msg
view model =
    main_ []
        [ stylesheet
        , fontAwesomeCDN
        , exampleNavbar
        , exampleHero

        -- , exampleColumns
        -- , exampleTiles
        -- , exampleLevel
        , exampleElementsAndComponents
        , exampleFooter
        ]


exampleNavbar : Html Msg
exampleNavbar =
    navbar navbarModifiers
        []
        [ navbarBrand []
            (navbarBurger False
                []
                [ span [] []
                , span [] []
                , span [] []
                ]
            )
            [ navbarItem False
                []
                [ img [ src "https://bulma.io/images/bulma-logo.png" ] []
                ]
            ]
        , navbarMenu False
            []
            [ navbarStart []
                [ navbarItemLink False [] [ text "Home" ]
                , navbarItemDropdown True
                    down
                    []
                    (navbarLink [] [ text "Docs" ])
                    [ navbarDropdown True
                        left
                        []
                        [ navbarItemLink False [] [ text "Crud" ]
                        , navbarItemLink False [] [ text "Detritus" ]
                        , navbarItemLink True [] [ text "Refuse" ]
                        , navbarItemLink False [] [ text "Trash" ]
                        ]
                    ]
                ]
            , navbarEnd []
                [ navbarItem False
                    []
                    [ fields left
                        []
                        [ controlButton { buttonModifiers | color = info } [] [] [ icon standard [] [ i [ class "fa fa-twitter" ] [] ], span [] [ text "Tweet" ] ]
                        , controlButton { buttonModifiers | color = primary } [] [] [ icon standard [] [ i [ class "fa fa-download" ] [] ], span [] [ text "Download" ] ]
                        ]
                    ]
                ]
            ]
        ]


exampleHero : Html Msg
exampleHero =
    hero { heroModifiers | color = info, size = medium }
        []
        [ heroBody []
            [ container []
                [ title h1 [] [ text "Hero Title" ]
                , title h2 [] [ text "Hero Subtitle" ]
                ]
            ]
        ]


myColumnModifiers : Width -> Maybe Width -> ColumnModifiers
myColumnModifiers offset width =
    let
        widths : Devices (Maybe Width)
        widths =
            columnModifiers.widths
    in
    { columnModifiers
        | offset =
            offset
        , widths =
            { widths
                | tablet = width
                , desktop = width
                , widescreen = width
                , fullHD = width
            }
    }


demoArticle : String -> List (Html Msg) -> Html Msg
demoArticle aTitle someHtmls =
    columns columnsModifiers
        []
        [ column (myColumnModifiers auto (Just width2))
            []
            [ title h4 [] [ strong [] [ text aTitle ] ]
            ]
        , column (myColumnModifiers auto (Just auto))
            []
            someHtmls
        ]


demoSection : String -> List (Attribute Msg) -> List (Html Msg) -> Html Msg
demoSection aSubtitle someAttrs someHtmls =
    columns columnsModifiers
        someAttrs
        [ column (myColumnModifiers auto (Just width3))
            []
            [ subtitle h4 [] [ text aSubtitle ]
            ]
        , column (myColumnModifiers auto (Just auto))
            []
            someHtmls
        ]


exampleMediaObject : Html Msg
exampleMediaObject =
    media []
        [ mediaLeft []
            [ image (oneByOne x64)
                []
                [ img [ src "https://bulma.io/images/placeholders/128x128.png" ] []
                ]
            ]
        , mediaContent []
            [ content standard
                []
                [ p []
                    [ strong [] [ text "John Smith" ]
                    , text " "
                    , Html.small [] [ text "@johnsmith" ]
                    , text " "
                    , Html.small [] [ text "31m" ]
                    , br [] []
                    , text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur sit amet massa fringilla egestas. Nullam condimentum luctus turpis."
                    ]
                ]
            , horizontalLevel []
                [ levelLeft []
                    [ levelItemLink [] [ icon small [] [ i [ class "fa fa-reply" ] [] ] ]
                    , levelItemLink [] [ icon small [] [ i [ class "fa fa-retweet" ] [] ] ]
                    , levelItemLink [] [ icon small [] [ i [ class "fa fa-heart" ] [] ] ]
                    ]
                ]
            ]
        ]


exampleElementsAndComponents : Html Msg
exampleElementsAndComponents =
    section notSpaced
        []
        [ container []
            [ demoArticle "Elements"
                [ demoSection "Form"
                    []
                    [ field []
                        [ controlLabel [] [ text "Form Label" ]
                        , controlInput controlInputModifiers [] [ placeholder "Input" ] []
                        , controlHelp default [] [ text "This field isn't required!" ]
                        ]
                    , field []
                        [ controlSelect controlSelectModifiers
                            []
                            []
                            [ option [] [ text "Dropdown" ]
                            ]
                        ]
                    , field []
                        [ controlTextArea controlTextAreaModifiers [] [ placeholder "Textarea" ] []
                        ]
                    , field []
                        [ controlCheckBox False
                            []
                            []
                            []
                            [ text "Checkbox"
                            ]
                        ]
                    , field []
                        [ controlRadio []
                            [ controlRadioButton False
                                True
                                "yes"
                                []
                                []
                                [ text "Radio"
                                ]
                            , controlRadioButton False
                                False
                                "no"
                                []
                                []
                                [ text "Button"
                                ]
                            ]
                        ]
                    , field []
                        [ controlButton { buttonModifiers | color = link }
                            []
                            []
                            [ text "Button"
                            ]
                        ]
                    ]
                , demoSection "Box"
                    []
                    [ box []
                        [ exampleMediaObject
                        ]
                    ]
                , demoSection "Button"
                    []
                    [ buttons left [] <|
                        List.map (\( color, label ) -> button { buttonModifiers | color = color } [] [ text label ])
                            [ ( default, "Default" )
                            , ( white, "White" )
                            , ( light, "Light" )
                            , ( dark, "Dark" )
                            , ( black, "Black" )
                            ]
                    , buttons left [] <|
                        List.map (\( color, label ) -> button { buttonModifiers | color = color } [] [ text label ])
                            [ ( primary, "Primary" )
                            , ( link, "Link" )
                            , ( info, "Info" )
                            , ( success, "Success" )
                            , ( warning, "Warning" )
                            , ( danger, "Danger" )
                            ]
                    ]
                , demoSection "Notification"
                    []
                    [ notificationWithDelete primary
                        []
                        NoOp
                        [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit lorem ipsum dolor. Pellentesque risus mi, tempus quis placerat ut, porta nec nulla. Vestibulum rhoncus ac ex sit amet fringilla. Nullam gravida purus diam, et dictum felis venenatis efficitur. Sit amet, consectetur adipiscing elit"
                        ]
                    ]
                , demoSection "Progress Bar"
                    []
                    [ easyProgress { progressModifiers | color = primary } [] 0.4
                    ]
                , demoSection "Tags"
                    []
                    [ tags [] <|
                        List.map (\( color, label ) -> tag { tagModifiers | color = color } [] [ text label ])
                            [ ( primary, "Primary" )
                            , ( link, "Link" )
                            , ( info, "Info" )
                            , ( success, "Success" )
                            , ( warning, "Warning" )
                            , ( danger, "Danger" )
                            ]
                    , tags [] <|
                        List.map (\( color, label ) -> tag { tagModifiers | color = color } [] [ text label ])
                            [ ( default, "Default" )
                            , ( white, "White" )
                            , ( light, "Light" )
                            , ( dark, "Dark" )
                            , ( black, "Black" )
                            ]
                    ]
                ]
            , demoArticle "Components"
                [ demoSection "Card"
                    []
                    [ columns columnsModifiers
                        []
                        [ column columnModifiers
                            []
                            [ card []
                                [ cardImage []
                                    [ image fourByThree
                                        []
                                        [ img [ src "https://bulma.io/images/placeholders/1280x960.png" ] []
                                        ]
                                    ]
                                , cardContent []
                                    [ media []
                                        [ mediaLeft []
                                            [ image (oneByOne x48)
                                                []
                                                [ img [ src "https://bulma.io/images/placeholders/96x96.png" ] []
                                                ]
                                            ]
                                        , mediaContent [] <|
                                            easyTitleWithSubtitle False
                                                h4
                                                [ text "John Smith" ]
                                                [ text "@johnsmith" ]
                                        ]
                                    , content standard
                                        []
                                        [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris."
                                        , a [] [ text "@bulmaio" ]
                                        , text "."
                                        , a [] [ text "#css" ]
                                        , text " "
                                        , a [] [ text "#responsive" ]
                                        , Html.small [] [ text "11:09 PM - 1 Jan 2016" ]
                                        ]
                                    ]
                                ]
                            ]
                        , column columnModifiers
                            []
                            [ card []
                                [ cardContent [] <|
                                    easyTitleWithSubtitle False
                                        h3
                                        [ text "“There are two hard things in computer science: cache invalidation, naming things, and off-by-one errors.”" ]
                                        [ text "Jeff Atwood" ]
                                , cardFooter []
                                    [ cardFooterItem []
                                        [ span []
                                            [ text "View on "
                                            , a [] [ text "Twitter" ]
                                            ]
                                        ]
                                    , cardFooterItem []
                                        [ span []
                                            [ text "Share on "
                                            , a [] [ text "Facebook" ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                , demoSection "Dropdown"
                    [ style "height" "16rem" ]
                    [ dropdown True
                        dropdownModifiers
                        []
                        [ dropdownTrigger []
                            [ button buttonModifiers
                                [ attribute "aria-haspopup" "true"
                                , attribute "aria-controls" "dropdown-menu"
                                ]
                                [ text "Dropdown button"
                                ]
                            ]
                        , dropdownMenu []
                            []
                            [ dropdownItem False [] [ text "Dropdown item" ]
                            , dropdownItemLink False [] [ text "Other dropdown item" ]
                            , dropdownItemLink True [] [ text "Active dropdown item" ]
                            , dropdownItemLink False [] [ text "Other item" ]
                            , dropdownDivider [] []
                            , dropdownItemLink False [] [ text "With a divider" ]
                            ]
                        ]
                    ]
                , demoSection "Message"
                    []
                    [ message { messageModifiers | color = primary }
                        []
                        [ messageHeaderWithDelete [] NoOp [ text "Primary" ]
                        , messageBody [] [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque risus mi, tempus quis placerat ut, porta nec nulla. Vestibulum rhoncus ac ex sit amet fringilla. Nullam gravida purus diam, et dictum felis venenatis efficitur. Aenean ac eleifend lacus, in mollis lectus. Donec sodales, arcu et sollicitudin porttitor, tortor urna tempor ligula, id porttitor mi magna a neque. Donec dui urna, vehicula et sem eget, facilisis sodales sem." ]
                        ]
                    ]
                , demoSection "Pagination"
                    []
                    [ pagination left
                        []
                        [ paginationPrev [] [ text "Previous" ]
                        , paginationNext [] [ text "Next" ]
                        , paginationList []
                            [ paginationLink False [] [ text "1" ]
                            , paginationEllipsis [] [ text "…" ]
                            , paginationLink False [] [ text "45" ]
                            , paginationLink True [] [ text "46" ]
                            , paginationLink False [] [ text "47" ]
                            , paginationEllipsis [] [ text "…" ]
                            , paginationLink False [] [ text "83" ]
                            ]
                        ]
                    ]
                , demoSection "Tabs"
                    []
                    [ tabs { tabsModifiers | style = boxed }
                        []
                        []
                        [ tab True [] [] [ icon standard [] [ i [ class "fa fa-image" ] [] ], text "Pictures" ]
                        , tab False [] [] [ icon standard [] [ i [ class "fa fa-music" ] [] ], text "Music" ]
                        , tab False [] [] [ icon standard [] [ i [ class "fa fa-film" ] [] ], text "Videos" ]
                        , tab False [] [] [ icon standard [] [ i [ class "fa fa-file-pdf-o" ] [] ], text "Documents" ]
                        ]
                    ]
                , demoSection "Media Object"
                    []
                    [ exampleMediaObject
                    ]
                , demoSection "Menu & Panel"
                    []
                    [ columns columnsModifiers
                        []
                        [ column columnModifiers
                            []
                            [ menu []
                                [ menuLabel [] [ text "General" ]
                                , menuList []
                                    [ menuListItem [] [ menuListItemLink False [] [ text "Dashboard" ] ]
                                    , menuListItem [] [ menuListItemLink False [] [ text "Customers" ] ]
                                    ]
                                , menuLabel [] [ text "Administration" ]
                                , menuList []
                                    [ menuListItem []
                                        [ menuListItemLink False [] [ text "Team Settings" ]
                                        ]
                                    , menuListItem []
                                        [ menuListItemLink True [] [ text "Manage Your Team" ]
                                        , menuList []
                                            [ menuListItemLink False [] [ text "Members" ]
                                            , menuListItemLink False [] [ text "Plugins" ]
                                            , menuListItemLink False [] [ text "Add a member" ]
                                            ]
                                        ]
                                    , menuListItem []
                                        [ menuListItemLink False [] [ text "Invitations" ]
                                        ]
                                    , menuListItem []
                                        [ menuListItemLink False [] [ text "Cloud Storage Environment Settings" ]
                                        ]
                                    , menuListItem []
                                        [ menuListItemLink False [] [ text "Authentication" ]
                                        ]
                                    ]
                                , menuLabel [] [ text "Transactions" ]
                                , menuList []
                                    [ menuListItem [] [ menuListItemLink False [] [ text "Payments" ] ]
                                    , menuListItem [] [ menuListItemLink False [] [ text "Transfers" ] ]
                                    , menuListItem [] [ menuListItemLink False [] [ text "Balance" ] ]
                                    ]
                                ]
                            ]
                        , column columnModifiers
                            []
                            [ panel []
                                [ panelHeading [] [ text "Repositories" ]
                                , panelBlock False
                                    []
                                    [ controlInput controlInputModifiers [] [] []
                                    ]
                                , panelTabs []
                                    [ panelTab False [] [ text "All" ]
                                    , panelTab True [] [ text "Public" ]
                                    , panelTab True [] [ text "Private" ]
                                    , panelTab True [] [ text "Sources" ]
                                    , panelTab True [] [ text "Forks" ]
                                    ]
                                , panelLinkWithIcon True [] [] [ i [ class "fa fa-book" ] [] ] [ text "bulma" ]
                                , panelLinkWithIcon False [] [] [ i [ class "fa fa-book" ] [] ] [ text "marksheet" ]
                                , panelLinkWithIcon False [] [] [ i [ class "fa fa-book" ] [] ] [ text "minireset.css" ]
                                , panelLinkWithIcon False [] [] [ i [ class "fa fa-book" ] [] ] [ text "jgthms.github.io" ]
                                , panelLinkWithIcon False [] [] [ i [ class "fa fa-code-fork" ] [] ] [ text "daniellowtw/infBoard" ]
                                , panelLinkWithIcon False [] [] [ i [ class "fa fa-code-fork" ] [] ] [ text "mojs" ]
                                , panelCheckbox False [] [] [ text "Remember Me" ]
                                , panelBlock False
                                    []
                                    [ button { buttonModifiers | color = link }
                                        [ fullWidth ]
                                        [ text "Reset all filters"
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


exampleFooter : Html Msg
exampleFooter =
    footer []
        [ container []
            [ content standard
                [ textCentered ]
                [ p []
                    [ strong [] [ text "Bulma" ]
                    , text " by "
                    , a [ href "https://jgthms.com" ] [ text "Jeremy Thomas" ]
                    , text ". The source code is licensed "
                    , a [ href "http://opensource.org/licenses/mit-license.php" ] [ text "MIT" ]
                    , text ". The website content is licensed "
                    , a [ href "http://creativecommons.org/licenses/by-nc-sa/4.0" ] [ text "CC BY NC SA 4.0" ]
                    , text "."
                    ]
                ]
            ]
        ]
