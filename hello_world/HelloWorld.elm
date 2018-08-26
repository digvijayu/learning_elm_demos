-- Define the module
-- Note the name should be exactly the same as file name


module HelloWorld exposing (main)

-- Import html package

import Html exposing (Html, div, text)


-- Type annotations of main, it shows you the parameters expected and
-- type of the returned data
-- The main currently returns Html which may or may not trigger messages
-- We'll look into msgs later


main : Html msg
main =
    div [] [ text "hello world" ]
