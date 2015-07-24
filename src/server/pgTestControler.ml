open Opium.Std
open PgControler

let test_index = begin fun req ->
  ignore req ;
  `String ("#index") |> respond'
end

let test_new = begin fun req -> 
  ignore req ;
  `String ("#new") |> respond'
end

let test_create = begin fun req ->
  ignore req ;
  `String ("#create") |> respond'
end

let test_show = begin fun req ->
  `String ("#show" ^ param req "id" ) |> respond'
end

let test_edit = begin fun req -> 
  `String ("#edit" ^ param req "id" ) |> respond'
end

let test_update = begin fun req ->
  `String ("#update" ^ param req "id") |> respond'
end

let test_destroy = begin fun req ->
  `String ("#destroy" ^ param req "id") |> respond'
end

let controler_struct = {
  action_index   = test_index ;
  action_new     = test_new ;
  action_create  = test_create ;
  action_show    = test_show ;
  action_edit    = test_edit ;
  action_update  = test_update ;
  action_destroy = test_destroy ;
}

