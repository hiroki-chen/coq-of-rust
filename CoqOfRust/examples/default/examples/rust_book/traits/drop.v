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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let~ _ :=
            let~ _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_function (| "std::io::stdio::_print", [] |),
                  [
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                      [
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array
                              [
                                M.read (| Value.String "> Dropping " |);
                                M.read (| Value.String "
" |)
                              ]
                          |));
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array
                              [
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.path "core::fmt::rt::Argument",
                                    "new_display",
                                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                  |),
                                  [
                                    M.SubPointer.get_struct_record_field (|
                                      M.read (| self |),
                                      "drop::Droppable",
                                      "name"
                                    |)
                                  ]
                                |)
                              ]
                          |))
                      ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |) in
          M.alloc (| Value.Tuple [] |)
        |)))
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
    ltac:(M.monadic
      (M.read (|
        let~ _a :=
          M.alloc (|
            Value.StructRecord "drop::Droppable" [ ("name", M.read (| Value.String "a" |)) ]
          |) in
        let~ _ :=
          let~ _b :=
            M.alloc (|
              Value.StructRecord "drop::Droppable" [ ("name", M.read (| Value.String "b" |)) ]
            |) in
          let~ _ :=
            let~ _c :=
              M.alloc (|
                Value.StructRecord "drop::Droppable" [ ("name", M.read (| Value.String "c" |)) ]
              |) in
            let~ _d :=
              M.alloc (|
                Value.StructRecord "drop::Droppable" [ ("name", M.read (| Value.String "d" |)) ]
              |) in
            let~ _ :=
              let~ _ :=
                M.alloc (|
                  M.call_closure (|
                    M.get_function (| "std::io::stdio::_print", [] |),
                    [
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::fmt::Arguments",
                          "new_const",
                          []
                        |),
                        [
                          (* Unsize *)
                          M.pointer_coercion
                            (M.alloc (|
                              Value.Array [ M.read (| Value.String "Exiting block B
" |) ]
                            |))
                        ]
                      |)
                    ]
                  |)
                |) in
              M.alloc (| Value.Tuple [] |) in
            M.alloc (| Value.Tuple [] |) in
          let~ _ :=
            let~ _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_function (| "std::io::stdio::_print", [] |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "core::fmt::Arguments",
                        "new_const",
                        []
                      |),
                      [
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array [ M.read (| Value.String "Just exited block B
" |) ]
                          |))
                      ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |) in
          let~ _ :=
            let~ _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_function (| "std::io::stdio::_print", [] |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "core::fmt::Arguments",
                        "new_const",
                        []
                      |),
                      [
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array [ M.read (| Value.String "Exiting block A
" |) ]
                          |))
                      ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |) in
          M.alloc (| Value.Tuple [] |) in
        let~ _ :=
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array [ M.read (| Value.String "Just exited block A
" |) ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let~ _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "core::mem::drop", [ Ty.path "drop::Droppable" ] |),
              [ M.read (| _a |) ]
            |)
          |) in
        let~ _ :=
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array [ M.read (| Value.String "end of the main function
" |) ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "drop::main" main.
