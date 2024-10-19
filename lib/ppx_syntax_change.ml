open Ppxlib

(* The transformation function *)
let expand ~ctxt input_str =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  let str = Ast_builder.Default.estring ~loc (String.uppercase_ascii input_str) in
  str

(* Register the extension *)
let () =
  let extension =
    Extension.V3.declare
      "uppercase" (* Name of the extension: [%uppercase] *)
      Extension.Context.expression
      Ast_pattern.(single_expr_payload (estring __)) (* Only works on strings *)
      expand
  in
  let rule = Context_free.Rule.extension extension in
  Driver.register_transformation ~rules:[rule] "ppx_syntax_change"
