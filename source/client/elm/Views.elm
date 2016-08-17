module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Html.App exposing (map)
import Bootstrap.Html exposing (..)
import Maybe exposing (withDefault)


-- Local Imports

import Pages exposing (Page)
import Models exposing (Model)
import Messages exposing (Message)
import Utilities.Layout exposing (..)
import ElmArchitecture.Button
import ElmArchitecture.Clock


view : Model -> Html Message
view model =
    case model.currentPage of
        Pages.Test ->
            pageLayout
                [ text "Hello!"
                , br'
                , homeLink
                , br'
                , modelDisplay model
                , br'
                , getQuoteButton
                , text (withDefault "" model.designQuote)
                ]

        Pages.Main ->
            pageLayout
                [ counter model
                , br'
                , textInput model
                , br'
                , modelDisplay model
                , br'
                , testLink
                ]

        Pages.Counter ->
            pageLayout
                [ text "Not actually a counter"
                , br'
                , counter model
                , br'
                , webSocketButton
                , br'
                , homeLink
                ]

        Pages.Button ->
            pageLayout [ map (\msg -> Messages.Button msg) (ElmArchitecture.Button.view model.buttonModel) ]

        Pages.Clock ->
            pageLayout [ map (\msg -> Messages.Clock msg) (ElmArchitecture.Clock.view model.clockModel) ]


modelDisplay : a -> Html b
modelDisplay model =
    pre [] [ text (toString model) ]


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
    a [ onClick (Messages.NavigatePage "test") ] [ text "Test" ]


homeLink : Html Message
homeLink =
    a [ onClick (Messages.NavigatePage "") ] [ text "Home" ]


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


getQuoteButton : Html Message
getQuoteButton =
    btnDefault' "btn-block"
        { btnParam
            | label = Just "GET HTTP QUOTE"
        }
        Messages.GetDesignQuote


webSocketButton : Html Message
webSocketButton =
    btnDefault' "btn-block"
        { btnParam
            | label = Just "Send message"
        }
        (Messages.SendWebSocketMessage "Some string")


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
