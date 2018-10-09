module HelloWorld exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json


main : Program Never Model Msg
main =
    Html.program
        { update = update
        , view = view
        , init = init
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( { list = [], inputValue = "" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MODEL


type alias Model =
    { list : List String
    , inputValue : String
    }



-- UPDATE


type Msg
    = AddItem String
    | RemoveItem Int
    | InputChange String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddItem description ->
            case description of
                "" ->
                    ( model, Cmd.none )

                val ->
                    { model | list = model.list ++ [ val ], inputValue = "" } ! []

        RemoveItem index ->
            { model | list = (List.take index model.list) ++ (List.drop (index + 1) model.list) } ! []

        InputChange inputStr ->
            { model | inputValue = inputStr } ! []



-- VIEW


view : Model -> Html Msg
view model =
    section [ class "todoapp" ]
        [ div [ class "input-container" ]
            [ input [ class "new-todo", onInput InputChange, value model.inputValue ]
                []
            , button
                [ class "add-button", onClick <| AddItem model.inputValue ]
                [ text "Add Item" ]
            ]
        , ul [ class "todo-list" ]
            (List.indexedMap addListItem model.list)
        ]


addListItem : Int -> String -> Html Msg
addListItem index description =
    li []
        [ label [] [ text description ]
        , button [ class "destroy", onClick (RemoveItem index) ] []
        ]
