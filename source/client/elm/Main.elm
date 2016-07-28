import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Bootstrap.Html exposing (..)
import RouteUrl exposing (..)
import Navigation exposing (Location, newUrl)
import Debug exposing (log)
import Mouse
import Time

import Pages.Button as ButtonPage
import Pages.Field as FieldPage
import Utilities.Layout exposing (..)


delta2url : Model -> Model -> Maybe UrlChange
delta2url oldModel newModel =
  case newModel of
    -- Just "/test" ->
    --   Just
    --     { entry = NewEntry
    --     , url = "/test"
    --     }
    _ ->
      Nothing
        


location2messages : Location -> List Msg
location2messages location =
  case location.pathname of
    "/test" ->
      [ Increment
      , Increment
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



-- MODEL


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

init : (Model, Cmd Msg)
init = (model, Cmd.none)


-- UPDATE


type Msg
  = Increment
  | MouseMove Mouse.Position
  | TimeTick Time.Time
  | NavigatePage
  | Decrement
  | UpdateInput String


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment ->
      ( { model
        | message = ""
        , counter = model.counter + 1
        }
      , Cmd.none )

    Decrement -> decrementModel model

    UpdateInput input ->
      ( { model | input = input }, Cmd.none )

    NavigatePage ->
      ( model, newUrl "/test" )
    
    MouseMove position ->
      ( { model
        | mousePosition = position
        }
      , Cmd.none )
    
    TimeTick newTime ->
      ( { model
        | time = newTime
        }
      , Cmd.none )


decrementModel : Model -> (Model, Cmd Msg)
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
    , Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ Mouse.clicks MouseMove
    , Time.every Time.second TimeTick
    ]


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
    , br'
    , testLink
    ]


testLink : Html Msg
testLink = a [ onClick NavigatePage ] [ text "Click me!" ]


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
    , colXs_ 6
      [ text model.message ]
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
