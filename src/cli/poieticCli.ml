
open Cmdliner

let () = begin
  let res =
    PgCli.setup PgApp.run 
    |> Term.eval
  in
  match res with
  | `Error _ -> exit 1 (* FIXME: show error message *)
  | _        -> exit 0
end

