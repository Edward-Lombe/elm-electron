module Main exposing (..)


import RouteUrl exposing (..)
import Navigation exposing (Location, newUrl)
import Debug exposing (log)


import Views exposing (view)
import Subscriptions exposing (subscriptions)
import Updates exposing (update)
import Messages exposing (Message)
import Models exposing (Model, init)


delta2url : Model -> Model -> Maybe UrlChange
delta2url oldModel newModel =
  case newModel of
    _ ->
      Nothing


location2messages : Location -> List Message
location2messages location =
  case location.pathname of
    "/test" ->
      [ Messages.Increment
      , Messages.Increment
      ]
    _ ->
      log (toString location) []


main : Program Never
main =
  program
    { init = init
    , delta2url = delta2url
    , location2messages = location2messages
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
