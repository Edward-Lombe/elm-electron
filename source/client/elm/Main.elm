module Main exposing (..)

import Debug exposing (log)
import RouteUrl exposing (..)
import Navigation exposing (Location, newUrl)


-- Local Imports

import Views exposing (view)
import Updates exposing (update)
import Messages exposing (Message)
import Models exposing (Model, init)
import Subscriptions exposing (subscriptions)


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
        , view = view
        , update = update
        , delta2url = delta2url
        , subscriptions = subscriptions
        , location2messages = location2messages
        }
