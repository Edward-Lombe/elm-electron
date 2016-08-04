module Utilities.Layout exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Bootstrap.Html exposing (..)


type alias Component a =
    List (Html a) -> Html a


listGroup : Component a
listGroup children =
    ul [ class "list-group" ]
        [ listGroupItem [ t "Hello" ]
        , listGroupItem [ t "Hello" ]
        ]


t : String -> Html a
t tString =
    text tString


listGroupItem : Component a
listGroupItem children =
    li [ class "list-group-item" ] children


container : Component a
container content =
    containerFluid_ [ row_ [ colXs_ 12 content ] ]


navbar : Html a
navbar =
    navbarDefault' ""
        [ container
            [ navbarHeader_
                [ a [ class "navbar-brand" ]
                    [ text "Home" ]
                ]
            ]
        ]
