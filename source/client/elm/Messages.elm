module Messages exposing (..)

import Mouse
import Time


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
