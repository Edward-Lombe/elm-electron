module Updates exposing (update)

import Navigation exposing (newUrl)
import Debug exposing (log)
import WebSocket


-- Local Imports

import Models exposing (Model)
import Messages exposing (Message(..))
import TestWebSocket exposing (webSocketAddress)
import ElmArchitecture.Button
import ElmArchitecture.Clock


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    case msg of
        Increment ->
            ( { model
                | message = ""
                , counter = model.counter + 1
              }
            , cn
            )

        Decrement ->
            decrementModel model

        UpdateInput input ->
            ( { model | input = input }, cn )

        NavigatePage pageString ->
            ( model, newUrl ("/" ++ pageString) )

        MouseMove position ->
            ( { model
                | mousePosition = position
              }
            , cn
            )

        TimeTick newTime ->
            ( { model
                | time = newTime
              }
            , cn
            )

        SubmitSaleNote ->
            addSaleNote model

        DisplayPage page ->
            ( { model
                | currentPage = page
              }
            , cn
            )

        Button msg ->
            ( { model
                | buttonModel = (ElmArchitecture.Button.update msg model.buttonModel)
              }
            , cn
            )

        Clock msg ->
            ( { model
                | clockModel = fst (ElmArchitecture.Clock.update msg model.clockModel)
              }
            , cn
            )

        WebSocketMessage str ->
            ( log ("str is " ++ str) model, cn )

        SendWebSocketMessage str ->
            ( model , WebSocket.send webSocketAddress str )

        NoOp ->
            ( model, cn )


cn : Cmd a
cn =
    Cmd.none


addSaleNote : Model -> ( Model, Cmd Message )
addSaleNote model =
    if model.input == "" then
        ( { model
            | message = "Enter something before adding a sale note"
          }
        , Cmd.none
        )
    else
        ( { model
            | saleNotes =
                ({ saleNoteNumber = model.input
                 , createdAt = model.time
                 }
                )
                    :: model.saleNotes
            , input = ""
          }
        , Cmd.none
        )


decrementModel : Model -> ( Model, Cmd Message )
decrementModel model =
    if model.counter > 0 then
        ( { model
            | counter = model.counter - 1
          }
        , Cmd.none
        )
    else
        ( { model
            | message = "Cannot decrement past 0"
          }
        , Cmd.none
        )
