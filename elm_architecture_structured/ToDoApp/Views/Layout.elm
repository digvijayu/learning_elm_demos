module ToDoApp.Views.Layout exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import ToDoApp.Views.Input as Input
import ToDoApp.Views.ToDoItem as ToDoItem
import ToDoApp.Types as Types


view : Types.Model -> Html Types.Msg
view model =
    section [ class "todoapp" ]
        [ Input.view model
        , ul [ class "todo-list" ]
            (List.indexedMap ToDoItem.addListItem model.list)
        ]
