module Subscriptions exposing (subscriptions)

import Mouse
import Time
import WebSocket

-- Local Imports

import TestWebSocket exposing (webSocketAddress)
import Models exposing (Model)
import Messages exposing (Message)
import ElmArchitecture.Clock


subscriptions : Model -> Sub Message
subscriptions model =
    Sub.batch
        [ Mouse.clicks Messages.MouseMove
        , Time.every Time.second Messages.TimeTick
        , Sub.map (\msg -> Messages.Clock msg) (ElmArchitecture.Clock.subscriptions model.clockModel)
        , WebSocket.listen webSocketAddress Messages.WebSocketMessage
        ]
