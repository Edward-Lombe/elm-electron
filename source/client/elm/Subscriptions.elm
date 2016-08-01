module Subscriptions exposing (subscriptions)

import Mouse
import Time


-- Local Imports

import Models exposing (Model)
import Messages exposing (Message)


subscriptions : Model -> Sub Message
subscriptions model =
    Sub.batch
        [ Mouse.clicks Messages.MouseMove
        , Time.every Time.second Messages.TimeTick
        ]
