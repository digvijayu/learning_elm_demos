module ToDoApp.State exposing (..)

import ToDoApp.Types as Types


init : ( Types.Model, Cmd Types.Msg )
init =
    ( { list = [], inputValue = "" }, Cmd.none )


subscriptions : Types.Model -> Sub Types.Msg
subscriptions model =
    Sub.none


update : Types.Msg -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update msg model =
    case msg of
        Types.AddItem description ->
            case description of
                "" ->
                    ( model, Cmd.none )

                val ->
                    { model | list = model.list ++ [ val ], inputValue = "" } ! []

        Types.RemoveItem index ->
            { model | list = (List.take index model.list) ++ (List.drop (index + 1) model.list) } ! []

        Types.InputChange inputStr ->
            { model | inputValue = inputStr } ! []
