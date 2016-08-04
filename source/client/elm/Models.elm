module Models exposing (Model, init)

import Mouse
import Time


-- Local Imports

import Messages exposing (Message)


type alias SaleNote =
    { saleNoteNumber : String
    , createdAt : Time.Time
    }


type alias Model =
    { counter : Int
    , input : String
    , message : String
    , mousePosition : Mouse.Position
    , time : Time.Time
    , saleNotes : List SaleNote
    , showPage : Bool
    }


model : Model
model =
    { counter = 0
    , input = ""
    , message = ""
    , mousePosition =
        { x = 0
        , y = 0
        }
    , time = 0
    , saleNotes = []
    , showPage = False
    }


init : ( Model, Cmd Message )
init =
    ( model, Cmd.none )
