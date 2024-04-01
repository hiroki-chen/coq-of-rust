(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Status *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Rich";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Poor";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

(* Enum Work *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Civilian";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Soldier";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

(*
fn main() {
    // Equivalent to `Status::Poor`.
    let status = Poor;
    // Equivalent to `Work::Civilian`.
    let work = Civilian;

    match status {
        // Note the lack of scoping because of the explicit `use` above.
        Rich => println!("The rich have lots of money!"),
        Poor => println!("The poor have no money..."),
    }

    match work {
        // Note again the lack of scoping.
        Civilian => println!("Civilians work!"),
        Soldier => println!("Soldiers fight!"),
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* status := M.alloc (Value.StructTuple "enums_use::Status::Poor" []) in
    let* work := M.alloc (Value.StructTuple "enums_use::Work::Civilian" []) in
    let* _ :=
      M.match_operator
        status
        [
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "The rich have lots of money!
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in
              M.alloc α6 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "The poor have no money...
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in
              M.alloc α6 in
            M.alloc (Value.Tuple [])
        ] in
    let* α0 :=
      M.match_operator
        work
        [
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Civilians work!
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in
              M.alloc α6 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Soldiers fight!
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in
              M.alloc α6 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
