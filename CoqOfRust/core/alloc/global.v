(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module alloc.
  Module global.
    (* Trait *)
    Module GlobalAlloc.
      Definition alloc_zeroed (Self : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; layout ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let layout := M.alloc (| layout |) in
            M.read (|
              let size :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "core::alloc::layout::Layout",
                      "size",
                      []
                    |),
                    [ layout ]
                  |)
                |) in
              let ptr :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::alloc::global::GlobalAlloc",
                      Self,
                      [],
                      "alloc",
                      []
                    |),
                    [ M.read (| self |); M.read (| layout |) ]
                  |)
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              UnOp.Pure.not
                                (M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.apply (Ty.path "*mut") [ Ty.path "u8" ],
                                    "is_null",
                                    []
                                  |),
                                  [ M.read (| ptr |) ]
                                |))
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let _ :=
                          M.alloc (|
                            M.call_closure (|
                              M.get_function (|
                                "core::intrinsics::write_bytes",
                                [ Ty.path "u8" ]
                              |),
                              [ M.read (| ptr |); Value.Integer Integer.U8 0; M.read (| size |) ]
                            |)
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              ptr
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom ProvidedMethod_alloc_zeroed :
        M.IsProvidedMethod "core::alloc::global::GlobalAlloc" "alloc_zeroed" alloc_zeroed.
      Definition realloc (Self : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; ptr; layout; new_size ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let ptr := M.alloc (| ptr |) in
            let layout := M.alloc (| layout |) in
            let new_size := M.alloc (| new_size |) in
            M.read (|
              let new_layout :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "core::alloc::layout::Layout",
                      "from_size_align_unchecked",
                      []
                    |),
                    [
                      M.read (| new_size |);
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::alloc::layout::Layout",
                          "align",
                          []
                        |),
                        [ layout ]
                      |)
                    ]
                  |)
                |) in
              let new_ptr :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::alloc::global::GlobalAlloc",
                      Self,
                      [],
                      "alloc",
                      []
                    |),
                    [ M.read (| self |); M.read (| new_layout |) ]
                  |)
                |) in
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              UnOp.Pure.not
                                (M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.apply (Ty.path "*mut") [ Ty.path "u8" ],
                                    "is_null",
                                    []
                                  |),
                                  [ M.read (| new_ptr |) ]
                                |))
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let _ :=
                          M.alloc (|
                            M.call_closure (|
                              M.get_function (|
                                "core::intrinsics::copy_nonoverlapping",
                                [ Ty.path "u8" ]
                              |),
                              [
                                (* MutToConstPointer *) M.pointer_coercion (M.read (| ptr |));
                                M.read (| new_ptr |);
                                M.call_closure (|
                                  M.get_function (| "core::cmp::min", [ Ty.path "usize" ] |),
                                  [
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::alloc::layout::Layout",
                                        "size",
                                        []
                                      |),
                                      [ layout ]
                                    |);
                                    M.read (| new_size |)
                                  ]
                                |)
                              ]
                            |)
                          |) in
                        let _ :=
                          M.alloc (|
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::alloc::global::GlobalAlloc",
                                Self,
                                [],
                                "dealloc",
                                []
                              |),
                              [ M.read (| self |); M.read (| ptr |); M.read (| layout |) ]
                            |)
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              new_ptr
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom ProvidedMethod_realloc :
        M.IsProvidedMethod "core::alloc::global::GlobalAlloc" "realloc" realloc.
    End GlobalAlloc.
  End global.
End alloc.
