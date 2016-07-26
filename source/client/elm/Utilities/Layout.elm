module Utilities.Layout exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Bootstrap.Html exposing (..)


container : List (Html a) -> Html a
container content = containerFluid_ [ row_ [ colXs_ 12 content ] ]


navbar : Html a
navbar = navbarDefault' ""
  [ container 
    [ navbarHeader_ 
      [ a [ class "navbar-brand" ]
        [ text "Home" ]
      ]
    ]
  ]