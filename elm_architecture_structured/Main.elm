module HelloWorld exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import ToDoApp.State as State
import ToDoApp.Types as Types
import ToDoApp.Views.Layout as Layout


main : Program Never Types.Model Types.Msg
main =
    Html.program
        { update = State.update
        , view = Layout.view
        , init = State.init
        , subscriptions = State.subscriptions
        }
