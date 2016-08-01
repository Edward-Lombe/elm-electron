module Messages exposing (..)


import Mouse
import Time

type Message
  = NoOp
  | Increment
  | MouseMove Mouse.Position
  | TimeTick Time.Time
  | NavigatePage
  | Decrement
  | UpdateInput String