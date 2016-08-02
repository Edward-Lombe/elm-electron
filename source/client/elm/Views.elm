module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Bootstrap.Html exposing (..)


-- Local Imports

import Models exposing (Model)
import Messages exposing (Message)
import Utilities.Layout exposing (..)


view : Model -> Html Message
view model =
    container
        [ br'
        , navbar
        , counter model
        , br'
        , textInput model
        , br'
        , pre [] [ text (toString model) ]
        , br'
        , testLink
        ]


testLink : Html Message
testLink =
    a [ onClick (Messages.NavigatePage "test") ] [ text "Click me!" ]


br' : Html a
br' =
    br [] []


counter : Model -> Html Message
counter model =
    row_
        [ colXs_ 4
            [ decrementButton ]
        , colXs_ 4
            [ div [ class "text-center" ] [ text (toString model.counter) ] ]
        , colXs_ 4
            [ incrementButton ]
        ]


textInput : Model -> Html Message
textInput model =
    row_
        [ colXs_ 6
            [ input
                [ value model.input
                , class "form-control"
                , onInput Messages.UpdateInput
                ]
                []
            ]
        , colXs_ 6
            [ text model.message ]
        ]


incrementButton : Html Message
incrementButton =
    btnDefault' "btn-block"
        { btnParam
            | label = Just "Increment"
        }
        Messages.Increment


decrementButton : Html Message
decrementButton =
    btnDefault' "btn-block"
        { btnParam
            | label = Just "Decrement"
        }
        Messages.Decrement
