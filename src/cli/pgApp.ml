
open Printf
open Core

let file = "example.dat"

let ($) f x = f x;;

let run () = 
    let oc = open_out file in
    let date = Date.format (Date.today Zone.local) "%Y-%m-%d" in
    fprintf oc "%s\n" "Yay" ;
    printf "Created %s-something.md \n" date ;

