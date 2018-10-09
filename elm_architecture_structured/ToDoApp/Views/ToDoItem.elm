module ToDoApp.Views.ToDoItem exposing (addListItem)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import ToDoApp.Types as Types


addListItem : Int -> String -> Html Types.Msg
addListItem index description =
    li []
        [ label [] [ text description ]
        , button [ class "destroy", onClick (Types.RemoveItem index) ] []
        ]
