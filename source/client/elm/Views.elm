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
    pageLayout
        [ counter model
        , br'
        , textInput model
        , br'
        , pre [] [ text (toString model) ]
        , br'
        , testLink
        ]


pageLayout : List (Html Message) -> Html Message
pageLayout children =
    container
        [ br'
        , navbar
        , row_
            [ colXs_ 3 [ listGroup [] ]
            , colXs_ 9 children
            ]
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
        , colXs_ 3
            [ addSaleNoteButton ]
        , colXs_ 3
            [ text model.message ]
        ]


addSaleNoteButton : Html Message
addSaleNoteButton =
    btnDefault' "btn-block"
        { btnParam
            | label = Just "Add Sale Note"
        }
        Messages.SubmitSaleNote


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
