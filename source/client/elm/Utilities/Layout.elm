module Utilities.Layout exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Bootstrap.Html exposing (..)


-- Local Imports

import Messages exposing (Message)


type alias Component a =
    List (Html a) -> Html a


listGroup : a -> Html Message
listGroup children =
    ul [ class "list-group" ]
        [ a
            [ onClick (Messages.NavigatePage "")
            , class "list-group-item"
            ]
            [ text "Main" ]
        , a
            [ onClick (Messages.NavigatePage "test")
            , class "list-group-item"
            ]
            [ text "Test" ]
        , a
            [ onClick (Messages.NavigatePage "counter")
            , class "list-group-item"
            ]
            [ text "Counter" ]
        , a
            [ onClick (Messages.NavigatePage "ElmArchitecture/Button")
            , class "list-group-item"
            ]
            [ text "Button" ]
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
