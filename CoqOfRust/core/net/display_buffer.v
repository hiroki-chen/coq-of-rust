(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module net.
  Module display_buffer.
    (* StructRecord
      {
        name := "DisplayBuffer";
        ty_params := [];
        fields :=
          [
            ("buf",
              Ty.apply
                (Ty.path "array")
                [ Ty.apply (Ty.path "core::mem::maybe_uninit::MaybeUninit") [ Ty.path "u8" ] ]);
            ("len", Ty.path "usize")
          ];
      } *)
    
    Module Impl_core_net_display_buffer_DisplayBuffer.
      Definition Self : Ty.t := Ty.path "core::net::display_buffer::DisplayBuffer".
      
      (*
          pub const fn new() -> Self {
              Self { buf: MaybeUninit::uninit_array(), len: 0 }
          }
      *)
      Definition new (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (Value.StructRecord
              "core::net::display_buffer::DisplayBuffer"
              [
                ("buf",
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply (Ty.path "core::mem::maybe_uninit::MaybeUninit") [ Ty.path "u8" ],
                      "uninit_array",
                      []
                    |),
                    []
                  |));
                ("len", Value.Integer 0)
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
      
      (*
          pub fn as_str(&self) -> &str {
              // SAFETY: `buf` is only written to by the `fmt::Write::write_str` implementation
              // which writes a valid UTF-8 string to `buf` and correctly sets `len`.
              unsafe {
                  let s = MaybeUninit::slice_assume_init_ref(&self.buf[..self.len]);
                  str::from_utf8_unchecked(s)
              }
          }
      *)
      Definition as_str (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              let~ s :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply (Ty.path "core::mem::maybe_uninit::MaybeUninit") [ Ty.path "u8" ],
                      "slice_assume_init_ref",
                      []
                    |),
                    [
                      M.call_closure (|
                        M.get_trait_method (|
                          "core::ops::index::Index",
                          Ty.apply
                            (Ty.path "array")
                            [
                              Ty.apply
                                (Ty.path "core::mem::maybe_uninit::MaybeUninit")
                                [ Ty.path "u8" ]
                            ],
                          [ Ty.apply (Ty.path "core::ops::range::RangeTo") [ Ty.path "usize" ] ],
                          "index",
                          []
                        |),
                        [
                          M.SubPointer.get_struct_record_field (|
                            M.read (| self |),
                            "core::net::display_buffer::DisplayBuffer",
                            "buf"
                          |);
                          Value.StructRecord
                            "core::ops::range::RangeTo"
                            [
                              ("end_",
                                M.read (|
                                  M.SubPointer.get_struct_record_field (|
                                    M.read (| self |),
                                    "core::net::display_buffer::DisplayBuffer",
                                    "len"
                                  |)
                                |))
                            ]
                        ]
                      |)
                    ]
                  |)
                |) in
              M.alloc (|
                M.call_closure (|
                  M.get_function (| "core::str::converts::from_utf8_unchecked", [] |),
                  [ M.read (| s |) ]
                |)
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_as_str : M.IsAssociatedFunction Self "as_str" as_str.
    End Impl_core_net_display_buffer_DisplayBuffer.
    
    Module Impl_core_fmt_Write_for_core_net_display_buffer_DisplayBuffer.
      Definition Self : Ty.t := Ty.path "core::net::display_buffer::DisplayBuffer".
      
      (*
          fn write_str(&mut self, s: &str) -> fmt::Result {
              let bytes = s.as_bytes();
      
              if let Some(buf) = self.buf.get_mut(self.len..(self.len + bytes.len())) {
                  MaybeUninit::write_slice(buf, bytes);
                  self.len += bytes.len();
                  Ok(())
              } else {
                  Err(fmt::Error)
              }
          }
      *)
      Definition write_str (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; s ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let s := M.alloc (| s |) in
            M.read (|
              let~ bytes :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "str", "as_bytes", [] |),
                    [ M.read (| s |) ]
                  |)
                |) in
              M.match_operator (|
                M.alloc (| Value.Tuple [] |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ :=
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.apply
                                (Ty.path "slice")
                                [
                                  Ty.apply
                                    (Ty.path "core::mem::maybe_uninit::MaybeUninit")
                                    [ Ty.path "u8" ]
                                ],
                              "get_mut",
                              [ Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ] ]
                            |),
                            [
                              (* Unsize *)
                              M.pointer_coercion
                                (M.SubPointer.get_struct_record_field (|
                                  M.read (| self |),
                                  "core::net::display_buffer::DisplayBuffer",
                                  "buf"
                                |));
                              Value.StructRecord
                                "core::ops::range::Range"
                                [
                                  ("start",
                                    M.read (|
                                      M.SubPointer.get_struct_record_field (|
                                        M.read (| self |),
                                        "core::net::display_buffer::DisplayBuffer",
                                        "len"
                                      |)
                                    |));
                                  ("end_",
                                    BinOp.Wrap.add
                                      Integer.Usize
                                      (M.read (|
                                        M.SubPointer.get_struct_record_field (|
                                          M.read (| self |),
                                          "core::net::display_buffer::DisplayBuffer",
                                          "len"
                                        |)
                                      |))
                                      (M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.apply (Ty.path "slice") [ Ty.path "u8" ],
                                          "len",
                                          []
                                        |),
                                        [ M.read (| bytes |) ]
                                      |)))
                                ]
                            ]
                          |)
                        |) in
                      let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::option::Option::Some",
                          0
                        |) in
                      let buf := M.copy (| γ0_0 |) in
                      let~ _ :=
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.apply
                                (Ty.path "core::mem::maybe_uninit::MaybeUninit")
                                [ Ty.path "u8" ],
                              "write_slice",
                              []
                            |),
                            [ M.read (| buf |); M.read (| bytes |) ]
                          |)
                        |) in
                      let~ _ :=
                        let β :=
                          M.SubPointer.get_struct_record_field (|
                            M.read (| self |),
                            "core::net::display_buffer::DisplayBuffer",
                            "len"
                          |) in
                        M.write (|
                          β,
                          BinOp.Wrap.add
                            Integer.Usize
                            (M.read (| β |))
                            (M.call_closure (|
                              M.get_associated_function (|
                                Ty.apply (Ty.path "slice") [ Ty.path "u8" ],
                                "len",
                                []
                              |),
                              [ M.read (| bytes |) ]
                            |))
                        |) in
                      M.alloc (|
                        Value.StructTuple "core::result::Result::Ok" [ Value.Tuple [] ]
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (M.alloc (|
                        Value.StructTuple
                          "core::result::Result::Err"
                          [ Value.StructTuple "core::fmt::Error" [] ]
                      |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::fmt::Write"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("write_str", InstanceField.Method write_str) ].
    End Impl_core_fmt_Write_for_core_net_display_buffer_DisplayBuffer.
  End display_buffer.
End net.
