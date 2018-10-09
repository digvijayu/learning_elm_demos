module ToDoApp.Types exposing (..)


type alias Model =
    { list : List String
    , inputValue : String
    }


type Msg
    = AddItem String
    | RemoveItem Int
    | InputChange String
