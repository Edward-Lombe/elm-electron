module Messages exposing (..)

import Mouse
import Time
import ElmArchitecture.Button
import ElmArchitecture.Clock


-- Local Imports

import Pages exposing (Page(..))


type Message
    = NoOp
    | Increment
    | MouseMove Mouse.Position
    | TimeTick Time.Time
    | NavigatePage String
    | Decrement
    | UpdateInput String
    | SubmitSaleNote
    | DisplayPage Page
    | Button ElmArchitecture.Button.Msg
    | Clock ElmArchitecture.Clock.Msg
    | WebSocketMessage String
    | SendWebSocketMessage String
    | GetDesignQuote
    | SetDesignQuote String
