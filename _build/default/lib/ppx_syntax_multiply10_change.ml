open Ppxlib

(* The transformation function *)
let expand ~ctxt input_int =
  let loc = Expansion_context.Extension.extension_point_loc ctxt in
  let mul10 = Ast_builder.Default.eint ~loc (input_int * 10) in
  mul10

(* Register the extension *)
let () =
  let extension =
    Extension.V3.declare
      "mul10" (* Name of the extension: [%uppercase] *)
      Extension.Context.expression
      Ast_pattern.(single_expr_payload (eint __)) (* Only works on strings *)
      expand
  in
  let rule = Context_free.Rule.extension extension in
  Driver.register_transformation ~rules:[rule] "mul_10_change"
