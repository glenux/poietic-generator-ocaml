
open Core.Std
open Cmdliner

(* validate command line parameters & consistency *)
let validate ~count ~callback = `Ok (callback ())

(* accept "count" parameter *)
let param_count = begin
  let doc = "Repeat something" in
  Arg.(value & opt int 10 & info ["c"; "count"] ~docv:"COUNT" ~doc)
end

(* command line setup *)
let setup main_callback = begin
  let doc = "Knowledge management tool" in
  let man = [
    `S "BUGS" ;
    `P "Email them to <glenux at glenux.net>." ;
  ] in
  Term.(
    validate ~count:param_count ~callback:main_callback
    |> pure 
    |> ret
  ), 
  Term.info "datalove" ~version:"0.0.1" ~doc ~man
end

