(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn create_box() {
    // Allocate an integer on the heap
    let _box1 = Box::new(3i32);

    // `_box1` is destroyed here, and memory gets freed
}
*)
Definition create_box (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _box1 :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "alloc::boxed::Box") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [ Value.Integer Integer.I32 3 ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Allocate an integer on the heap
    let _box2 = Box::new(5i32);

    // A nested scope:
    {
        // Allocate an integer on the heap
        let _box3 = Box::new(4i32);

        // `_box3` is destroyed here, and memory gets freed
    }

    // Creating lots of boxes just for fun
    // There's no need to manually free memory!
    for _ in 0u32..1_000 {
        create_box();
    }

    // `_box2` is destroyed here, and memory gets freed
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _box2 :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "alloc::boxed::Box") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [ Value.Integer Integer.I32 5 ] in
      M.alloc α1 in
    let* _ :=
      let* _box3 :=
        let* α0 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "alloc::boxed::Box")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
            "new"
            [] in
        let* α1 := M.call_closure α0 [ Value.Integer Integer.I32 4 ] in
        M.alloc α1 in
      M.alloc (Value.Tuple []) in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "u32" ])
        []
        "into_iter"
        [] in
    let* α1 :=
      M.call_closure
        α0
        [
          Value.StructRecord
            "core::ops::range::Range"
            [ ("start", Value.Integer Integer.U32 0); ("end_", Value.Integer Integer.U32 1000) ]
        ] in
    let* α2 := M.alloc α1 in
    let* α3 :=
      M.match_operator
        α2
        [
          fun γ =>
            let* iter := M.copy γ in
            M.loop
              (let* _ :=
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::iterator::Iterator"
                    (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "u32" ])
                    []
                    "next"
                    [] in
                let* α1 := M.call_closure α0 [ iter ] in
                let* α2 := M.alloc α1 in
                M.match_operator
                  α2
                  [
                    fun γ =>
                      let* α0 := M.break in
                      let* α1 := M.read α0 in
                      let* α2 := M.never_to_any α1 in
                      M.alloc α2;
                    fun γ =>
                      let* γ0_0 :=
                        M.get_struct_tuple_field_or_break_match γ "core::option::Option::Some" 0 in
                      let* _ :=
                        let* α0 := M.get_function "scoping_rules_raii::create_box" [] in
                        let* α1 := M.call_closure α0 [] in
                        M.alloc α1 in
                      M.alloc (Value.Tuple [])
                  ] in
              M.alloc (Value.Tuple []))
        ] in
    M.read (M.use α3)
  | _, _ => M.impossible
  end.
