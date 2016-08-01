module Models exposing (Model, init)


import Mouse
import Time


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


init : (Model, Cmd Message)
init = (model, Cmd.none)


-- import Dict exposing (..)

-- type Validation
--   = Sucess
--   | Warning
--   | Info
--   | Danger

-- type alias Input =
--   { key : String
--   , value : Maybe String
--   , label : Maybe String
--   , helpText: Maybe String
--   , valid : Maybe Validation
--   }

-- type alias Form =
--   { key : String
--   , inputs : Dict String Input
--   }

-- type alias Page =
--   { forms : Dict String Form
--   , link : String 
--   , title : Maybe String
--   }

-- type alias Model =
--   { pages : Dict String Page }