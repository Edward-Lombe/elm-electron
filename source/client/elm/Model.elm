module Model exposing (Model)

import Dict exposing (..)

type Validation
  = Sucess
  | Warning
  | Info
  | Danger

type alias Input =
  { key : String
  , value : Maybe String
  , label : Maybe String
  , helpText: Maybe String
  , valid : Maybe Validation
  }

type alias Form =
  { key : String
  , inputs : Dict String Input
  }

type alias Page =
  { forms : Dict String Form
  , link : String 
  , title : Maybe String
  }

type alias Model =
  { pages : Dict String Page }