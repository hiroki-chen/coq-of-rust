(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my_mod.
  (*
      fn private_function() {
          println!("called `my_mod::private_function()`");
      }
  *)
  Definition private_function (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
            let _ :=
              let _ :=
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
                                        Value.Array
                                          [
                                            M.read (| mk_str "called `my_mod::private_function()`
"
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
  
  (*
      pub fn function() {
          println!("called `my_mod::function()`");
      }
  *)
  Definition function (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
            let _ :=
              let _ :=
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
                                        Value.Array
                                          [ M.read (| mk_str "called `my_mod::function()`
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
  
  (*
      pub fn indirect_access() {
          print!("called `my_mod::indirect_access()`, that\n> ");
          private_function();
      }
  *)
  Definition indirect_access (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
            let _ :=
              let _ :=
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
                                        Value.Array
                                          [
                                            M.read (|
                                                mk_str "called `my_mod::indirect_access()`, that
> "
                                              |)
                                          ]
                                      |))
                              ]
                            |)
                        ]
                      |)
                  |) in
              M.alloc (| Value.Tuple [] |) in
            let _ :=
              M.alloc (|
                  M.call_closure (|
                      M.get_function (| "visibility::my_mod::private_function", [] |),
                      []
                    |)
                |) in
            M.alloc (| Value.Tuple [] |)
          |)))
    | _, _ => M.impossible
    end.
  
  Module nested.
    (*
            pub fn function() {
                println!("called `my_mod::nested::function()`");
            }
    *)
    Definition function (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (M.read (|
              let _ :=
                let _ :=
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
                                          Value.Array
                                            [
                                              M.read (|
                                                  mk_str "called `my_mod::nested::function()`
"
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
    
    (*
            fn private_function() {
                println!("called `my_mod::nested::private_function()`");
            }
    *)
    Definition private_function (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (M.read (|
              let _ :=
                let _ :=
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
                                          Value.Array
                                            [
                                              M.read (|
                                                  mk_str
                                                    "called `my_mod::nested::private_function()`
"
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
    
    (*
            pub(in crate::my_mod) fn public_function_in_my_mod() {
                print!("called `my_mod::nested::public_function_in_my_mod()`, that\n> ");
                public_function_in_nested();
            }
    *)
    Definition public_function_in_my_mod (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (M.read (|
              let _ :=
                let _ :=
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
                                          Value.Array
                                            [
                                              M.read (|
                                                  mk_str
                                                    "called `my_mod::nested::public_function_in_my_mod()`, that
> "
                                                |)
                                            ]
                                        |))
                                ]
                              |)
                          ]
                        |)
                    |) in
                M.alloc (| Value.Tuple [] |) in
              let _ :=
                M.alloc (|
                    M.call_closure (|
                        M.get_function (|
                            "visibility::my_mod::nested::public_function_in_nested",
                            []
                          |),
                        []
                      |)
                  |) in
              M.alloc (| Value.Tuple [] |)
            |)))
      | _, _ => M.impossible
      end.
    
    (*
            pub(self) fn public_function_in_nested() {
                println!("called `my_mod::nested::public_function_in_nested()`");
            }
    *)
    Definition public_function_in_nested (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (M.read (|
              let _ :=
                let _ :=
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
                                          Value.Array
                                            [
                                              M.read (|
                                                  mk_str
                                                    "called `my_mod::nested::public_function_in_nested()`
"
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
    
    (*
            pub(super) fn public_function_in_super_mod() {
                println!("called `my_mod::nested::public_function_in_super_mod()`");
            }
    *)
    Definition public_function_in_super_mod (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (M.read (|
              let _ :=
                let _ :=
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
                                          Value.Array
                                            [
                                              M.read (|
                                                  mk_str
                                                    "called `my_mod::nested::public_function_in_super_mod()`
"
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
  End nested.
  
  (*
      pub fn call_public_function_in_my_mod() {
          print!("called `my_mod::call_public_function_in_my_mod()`, that\n> ");
          nested::public_function_in_my_mod();
          print!("> ");
          nested::public_function_in_super_mod();
      }
  *)
  Definition call_public_function_in_my_mod (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
            let _ :=
              let _ :=
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
                                        Value.Array
                                          [
                                            M.read (|
                                                mk_str
                                                  "called `my_mod::call_public_function_in_my_mod()`, that
> "
                                              |)
                                          ]
                                      |))
                              ]
                            |)
                        ]
                      |)
                  |) in
              M.alloc (| Value.Tuple [] |) in
            let _ :=
              M.alloc (|
                  M.call_closure (|
                      M.get_function (| "visibility::my_mod::nested::public_function_in_my_mod", []
                        |),
                      []
                    |)
                |) in
            let _ :=
              let _ :=
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
                                    (M.alloc (| Value.Array [ M.read (| mk_str "> " |) ] |))
                              ]
                            |)
                        ]
                      |)
                  |) in
              M.alloc (| Value.Tuple [] |) in
            let _ :=
              M.alloc (|
                  M.call_closure (|
                      M.get_function (|
                          "visibility::my_mod::nested::public_function_in_super_mod",
                          []
                        |),
                      []
                    |)
                |) in
            M.alloc (| Value.Tuple [] |)
          |)))
    | _, _ => M.impossible
    end.
  
  (*
      pub(crate) fn public_function_in_crate() {
          println!("called `my_mod::public_function_in_crate()`");
      }
  *)
  Definition public_function_in_crate (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.read (|
            let _ :=
              let _ :=
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
                                        Value.Array
                                          [
                                            M.read (|
                                                mk_str
                                                  "called `my_mod::public_function_in_crate()`
"
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
  
  Module private_nested.
    (*
            pub fn function() {
                println!("called `my_mod::private_nested::function()`");
            }
    *)
    Definition function (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (M.read (|
              let _ :=
                let _ :=
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
                                          Value.Array
                                            [
                                              M.read (|
                                                  mk_str
                                                    "called `my_mod::private_nested::function()`
"
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
    
    (*
            pub(crate) fn restricted_function() {
                println!("called `my_mod::private_nested::restricted_function()`");
            }
    *)
    Definition restricted_function (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (M.read (|
              let _ :=
                let _ :=
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
                                          Value.Array
                                            [
                                              M.read (|
                                                  mk_str
                                                    "called `my_mod::private_nested::restricted_function()`
"
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
  End private_nested.
End my_mod.

(*
fn function() {
    println!("called `function()`");
}
*)
Definition function (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let _ :=
            let _ :=
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
                                      Value.Array [ M.read (| mk_str "called `function()`
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

(*
fn main() {
    // Modules allow disambiguation between items that have the same name.
    function();
    my_mod::function();

    // Public items, including those inside nested modules, can be
    // accessed from outside the parent module.
    my_mod::indirect_access();
    my_mod::nested::function();
    my_mod::call_public_function_in_my_mod();

    // pub(crate) items can be called from anywhere in the same crate
    my_mod::public_function_in_crate();

    // pub(in path) items can only be called from within the module specified
    // Error! function `public_function_in_my_mod` is private
    //my_mod::nested::public_function_in_my_mod();
    // TODO ^ Try uncommenting this line

    // Private items of a module cannot be directly accessed, even if
    // nested in a public module:

    // Error! `private_function` is private
    //my_mod::private_function();
    // TODO ^ Try uncommenting this line

    // Error! `private_function` is private
    //my_mod::nested::private_function();
    // TODO ^ Try uncommenting this line

    // Error! `private_nested` is a private module
    //my_mod::private_nested::function();
    // TODO ^ Try uncommenting this line

    // Error! `private_nested` is a private module
    //my_mod::private_nested::restricted_function();
    // TODO ^ Try uncommenting this line
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let _ :=
            M.alloc (| M.call_closure (| M.get_function (| "visibility::function", [] |), [] |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (| M.get_function (| "visibility::my_mod::function", [] |), [] |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (| M.get_function (| "visibility::my_mod::indirect_access", [] |), []
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "visibility::my_mod::nested::function", [] |),
                    []
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "visibility::my_mod::call_public_function_in_my_mod", [] |),
                    []
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "visibility::my_mod::public_function_in_crate", [] |),
                    []
                  |)
              |) in
          M.alloc (| Value.Tuple [] |)
        |)))
  | _, _ => M.impossible
  end.
