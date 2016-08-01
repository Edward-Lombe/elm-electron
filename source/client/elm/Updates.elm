module Updates exposing (update)

import Navigation exposing (newUrl)


-- Local Imports

import Models exposing (Model)
import Messages exposing (Message(..))


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    case msg of
        Increment ->
            ( { model
                | message = ""
                , counter = model.counter + 1
              }
            , Cmd.none
            )

        Decrement ->
            decrementModel model

        UpdateInput input ->
            ( { model | input = input }, Cmd.none )

        NavigatePage ->
            ( model, newUrl "/test" )

        MouseMove position ->
            ( { model
                | mousePosition = position
              }
            , Cmd.none
            )

        TimeTick newTime ->
            ( { model
                | time = newTime
              }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )


decrementModel : Model -> ( Model, Cmd Message )
decrementModel model =
    if model.counter > 0 then
        ( { model
            | counter = model.counter - 1
          }
        , Cmd.none
        )
    else
        ( { model
            | message = "Cannot decrement past 0"
          }
        , Cmd.none
        )
