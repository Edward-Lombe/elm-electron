import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Bootstrap.Html exposing (..)


import Utilities.Layout exposing (..)


main : Program Never
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { counter : Int
  , input : String }


model : Model
model =
  Model 0 ""


init : (Model, Cmd Msg)
init = (model, Cmd.none)


-- UPDATE


type Msg
  = Increment
  | Decrement
  | UpdateInput String


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment ->
      ({ model | counter = model.counter + 1 }, Cmd.none)

    Decrement ->
      if model.counter > 0 then
        ({ model | counter = model.counter - 1 }, Cmd.none)
      else
        (model, Cmd.none)

    UpdateInput input ->
      ({ model | input = input }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model = Sub.none


-- VIEW


view : Model -> Html Msg
view model =
  container 
    [ br'
    , navbar
    , counter model
    , br'
    , textInput model
    , br'
    , pre [] [ text (toString model) ]
    ]


br' : Html a
br' = br [] []


counter : Model -> Html Msg
counter model =
  row_
    [ colXs_ 4
      [ decrementButton ]
    , colXs_ 4
      [ div [ class "text-center" ] [ text (toString model.counter) ] ]
    , colXs_ 4
      [ incrementButton ]
    ]


textInput : Model -> Html Msg
textInput model =
  row_
    [ colXs_ 6
      [ input
        [ value model.input
        , class "form-control"
        , onInput UpdateInput ] []
      ]
    ]


incrementButton : Html Msg
incrementButton = btnDefault' "btn-block"
  { btnParam
  | label = Just "Increment"
  } Increment


decrementButton : Html Msg
decrementButton = btnDefault' "btn-block"
  { btnParam
  | label = Just "Decrement"
  } Decrement
