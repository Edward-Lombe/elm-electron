module Messages exposing (..)

import Mouse
import Time


-- Local Imports

import SaleNote exposing (SaleNote)


type Message
    = NoOp
    | Increment
    | MouseMove Mouse.Position
    | TimeTick Time.Time
    | NavigatePage String
    | Decrement
    | UpdateInput String
    | SubmitSaleNote
