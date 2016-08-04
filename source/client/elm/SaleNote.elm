module SaleNote exposing (..)

import Time


type alias SaleNote =
    { saleNoteNumber : String
    , createdAt : Time.Time
    }


type alias SaleNoteList =
    List SaleNote
