(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Droppable";
    ty_params := [];
    fields := [ ("name", Ty.apply (Ty.path "&") [ Ty.path "str" ]) ];
  } *)

Module Impl_core_ops_drop_Drop_for_drop_Droppable.
  Definition Self : Ty.t := Ty.path "drop::Droppable".
  
  (*
      fn drop(&mut self) {
          println!("> Dropping {}", self.name);
      }
  *)
  Definition drop (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
          let* α5 :=
            (* Unsize *)
              let* α2 := M.read (mk_str "> Dropping ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
          let* α10 :=
            (* Unsize *)
              let* α6 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
              let* α7 := M.read self in
              let* α8 :=
                M.call_closure α6 [ M.get_struct_record_field α7 "drop::Droppable" "name" ] in
              let* α9 := M.alloc (Value.Array [ α8 ]) in M.pure (M.pointer_coercion α9) in
          let* α11 := M.call_closure α1 [ α5; α10 ] in
          let* α12 := M.call_closure α0 [ α11 ] in M.alloc α12 in
        M.alloc (Value.Tuple []) in
      let* α0 := M.alloc (Value.Tuple []) in M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::drop::Drop"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("drop", InstanceField.Method drop) ].
End Impl_core_ops_drop_Drop_for_drop_Droppable.

(*
fn main() {
    let _a = Droppable { name: "a" };

    // block A
    {
        let _b = Droppable { name: "b" };

        // block B
        {
            let _c = Droppable { name: "c" };
            let _d = Droppable { name: "d" };

            println!("Exiting block B");
        }
        println!("Just exited block B");

        println!("Exiting block A");
    }
    println!("Just exited block A");

    // Variable can be manually dropped using the `drop` function
    drop(_a);
    // TODO ^ Try commenting this line

    println!("end of the main function");

    // `_a` *won't* be `drop`ed again here, because it already has been
    // (manually) `drop`ed
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _a :=
      let* α0 := M.read (mk_str "a") in
      M.alloc (Value.StructRecord "drop::Droppable" [ ("name", α0) ]) in
    let* _ :=
      let* _b :=
        let* α0 := M.read (mk_str "b") in
        M.alloc (Value.StructRecord "drop::Droppable" [ ("name", α0) ]) in
      let* _ :=
        let* _c :=
          let* α0 := M.read (mk_str "c") in
          M.alloc (Value.StructRecord "drop::Droppable" [ ("name", α0) ]) in
        let* _d :=
          let* α0 := M.read (mk_str "d") in
          M.alloc (Value.StructRecord "drop::Droppable" [ ("name", α0) ]) in
        let* _ :=
          let* _ :=
            let* α0 := M.get_function "std::io::stdio::_print" [] in
            let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
            let* α4 :=
              (* Unsize *)
                let* α2 := M.read (mk_str "Exiting block B
") in
                let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
            let* α5 := M.call_closure α1 [ α4 ] in
            let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
          M.alloc (Value.Tuple []) in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
          let* α4 :=
            (* Unsize *)
              let* α2 := M.read (mk_str "Just exited block B
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
          let* α5 := M.call_closure α1 [ α4 ] in
          let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
          let* α4 :=
            (* Unsize *)
              let* α2 := M.read (mk_str "Exiting block A
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
          let* α5 := M.call_closure α1 [ α4 ] in
          let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
        M.alloc (Value.Tuple []) in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
        let* α4 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Just exited block A
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
        let* α5 := M.call_closure α1 [ α4 ] in let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 := M.get_function "core::mem::drop" [ Ty.path "drop::Droppable" ] in
      let* α1 := M.read _a in let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
        let* α4 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "end of the main function
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
        let* α5 := M.call_closure α1 [ α4 ] in let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
