module ToDoApp.Views.Input exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import ToDoApp.Types as Types


view : Types.Model -> Html Types.Msg
view model =
    div [ class "input-container" ]
        [ input [ class "new-todo", onInput Types.InputChange, value model.inputValue ]
            []
        , button
            [ class "add-button", onClick <| Types.AddItem model.inputValue ]
            [ text "Add Item" ]
        ]
