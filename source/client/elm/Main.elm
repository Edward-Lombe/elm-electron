import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Bootstrap.Html exposing (..)


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model = Int


model : Model
model =
  0


init : (Model, Cmd Msg)
init = (model, Cmd.none)


-- UPDATE


type Msg
  = Increment
  | Decrement


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment ->
      (model + 1, Cmd.none)

    Decrement ->
      (model - 1, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model = Sub.none


-- VIEW


view : Model -> Html Msg
view model =
  container 
    [ br'
    , navbar
    , controls model
    ]


br' : Html a
br' = br [] []


controls : Model -> Html Msg
controls model =
  div []
    [ decrementButton
    , div [] [ text (toString model) ]
    , incrementButton
    ]


navbar : Html a
navbar = navbarDefault' ""
  [ container 
    [ navbarHeader_ 
      [ a [ class "navbar-brand" ]
        [ text "header" ]
      ]
    ]
  ]


container : List (Html a) -> Html a
container content = container_ [ row_ [ colXs_ 12 content ] ]


incrementButton : Html Msg
incrementButton = btnDefault_
  { btnParam
  | label = Just "Increment"
  } Increment


decrementButton : Html Msg
decrementButton = btnDefault_
  { btnParam
  | label = Just "Decrement"
  } Decrement
