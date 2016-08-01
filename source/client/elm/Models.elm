module Models exposing (Model, init)

import Mouse
import Time


-- Local Imports

import Messages exposing (Message)


type alias Model =
    { counter : Int
    , input : String
    , message : String
    , mousePosition : Mouse.Position
    , time : Time.Time
    }


model : Model
model =
    Model
        -- counter
        0
        -- input
        ""
        -- message
        ""
        -- mousePosition
        { x = 0, y = 0 }
        -- time
        0


init : ( Model, Cmd Message )
init =
    ( model, Cmd.none )
