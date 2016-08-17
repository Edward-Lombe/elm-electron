module Models exposing (..)

import Mouse
import Time


-- Local Imports

import Messages exposing (Message)
import Pages exposing (Page(..))
import ElmArchitecture.Button
import ElmArchitecture.Clock


type alias PouchDB a =
    { a | id : String, rev : String }


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
    , currentPage : Page
    , buttonModel : ElmArchitecture.Button.Model
    , clockModel : ElmArchitecture.Clock.Model
    , designQuote : Maybe String
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
    , currentPage = Main
    , buttonModel = ElmArchitecture.Button.model
    , clockModel = 0
    , designQuote = Nothing
    }


init : ( Model, Cmd Message )
init =
    ( model, Cmd.none )
