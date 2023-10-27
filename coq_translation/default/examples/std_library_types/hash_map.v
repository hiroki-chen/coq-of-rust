(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition call `{ℋ : State.Trait} (number : ref str) : M (ref str) :=
  match number with
  | _ =>
    let* α0 :=
      deref
        (mk_str
          "We're sorry, the call cannot be completed as dialed. 
            Please hang up and try again.")
        str in
    borrow α0 str
  | _ =>
    let* α0 :=
      deref
        (mk_str
          "Hello, this is Mr. Awesome's Pizza. My name is Fred.
            What can I get for you today?")
        str in
    borrow α0 str
  | _ =>
    let* α0 := deref (mk_str "Hi! Who is this again?") str in
    borrow α0 str
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* contacts :=
    (std.collections.hash.map.HashMap
        K
        V
        std.collections.hash.map.RandomState)::["new"] in
  let* _ :=
    let* α0 :=
      borrow_mut
        contacts
        (std.collections.hash.map.HashMap
          (ref str)
          (ref str)
          std.collections.hash.map.RandomState) in
    (std.collections.hash.map.HashMap K V S)::["insert"]
      α0
      (mk_str "Daniel")
      (mk_str "798-1364") in
  let* _ :=
    let* α0 :=
      borrow_mut
        contacts
        (std.collections.hash.map.HashMap
          (ref str)
          (ref str)
          std.collections.hash.map.RandomState) in
    let* α1 := deref (mk_str "Ashley") str in
    let* α2 := borrow α1 str in
    let* α3 := deref (mk_str "645-7689") str in
    let* α4 := borrow α3 str in
    (std.collections.hash.map.HashMap K V S)::["insert"] α0 α2 α4 in
  let* _ :=
    let* α0 :=
      borrow_mut
        contacts
        (std.collections.hash.map.HashMap
          (ref str)
          (ref str)
          std.collections.hash.map.RandomState) in
    let* α1 := deref (mk_str "Katie") str in
    let* α2 := borrow α1 str in
    let* α3 := deref (mk_str "435-8291") str in
    let* α4 := borrow α3 str in
    (std.collections.hash.map.HashMap K V S)::["insert"] α0 α2 α4 in
  let* _ :=
    let* α0 :=
      borrow_mut
        contacts
        (std.collections.hash.map.HashMap
          (ref str)
          (ref str)
          std.collections.hash.map.RandomState) in
    let* α1 := deref (mk_str "Robert") str in
    let* α2 := borrow α1 str in
    let* α3 := deref (mk_str "956-1745") str in
    let* α4 := borrow α3 str in
    (std.collections.hash.map.HashMap K V S)::["insert"] α0 α2 α4 in
  let* _ :=
    let* α0 :=
      borrow
        contacts
        (std.collections.hash.map.HashMap
          (ref str)
          (ref str)
          std.collections.hash.map.RandomState) in
    let* α1 := borrow (mk_str "Daniel") (ref str) in
    let* α2 := deref α1 (ref str) in
    let* α3 := borrow α2 (ref str) in
    let* α4 := (std.collections.hash.map.HashMap K V S)::["get"] α0 α3 in
    match α4 with
    | core.option.Option number =>
      let* _ :=
        let* α0 :=
          borrow [ mk_str "Calling Daniel: "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := deref number str in
        let* α5 := borrow α4 str in
        let* α6 := hash_map.call α5 in
        let* α7 := borrow α6 (ref str) in
        let* α8 := deref α7 (ref str) in
        let* α9 := borrow α8 (ref str) in
        let* α10 := core.fmt.rt.Argument::["new_display"] α9 in
        let* α11 := borrow [ α10 ] (list core.fmt.rt.Argument) in
        let* α12 := deref α11 (list core.fmt.rt.Argument) in
        let* α13 := borrow α12 (list core.fmt.rt.Argument) in
        let* α14 := pointer_coercion "Unsize" α13 in
        let* α15 := core.fmt.Arguments::["new_v1"] α3 α14 in
        std.io.stdio._print α15 in
      M.alloc tt
    | _ =>
      let* _ :=
        let* α0 :=
          borrow [ mk_str "Don't have Daniel's number.
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := core.fmt.Arguments::["new_const"] α3 in
        std.io.stdio._print α4 in
      M.alloc tt
    end in
  let* _ :=
    let* α0 :=
      borrow_mut
        contacts
        (std.collections.hash.map.HashMap
          (ref str)
          (ref str)
          std.collections.hash.map.RandomState) in
    let* α1 := deref (mk_str "Daniel") str in
    let* α2 := borrow α1 str in
    let* α3 := deref (mk_str "164-6743") str in
    let* α4 := borrow α3 str in
    (std.collections.hash.map.HashMap K V S)::["insert"] α0 α2 α4 in
  let* _ :=
    let* α0 :=
      borrow
        contacts
        (std.collections.hash.map.HashMap
          (ref str)
          (ref str)
          std.collections.hash.map.RandomState) in
    let* α1 := borrow (mk_str "Ashley") (ref str) in
    let* α2 := deref α1 (ref str) in
    let* α3 := borrow α2 (ref str) in
    let* α4 := (std.collections.hash.map.HashMap K V S)::["get"] α0 α3 in
    match α4 with
    | core.option.Option number =>
      let* _ :=
        let* α0 :=
          borrow [ mk_str "Calling Ashley: "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := deref number str in
        let* α5 := borrow α4 str in
        let* α6 := hash_map.call α5 in
        let* α7 := borrow α6 (ref str) in
        let* α8 := deref α7 (ref str) in
        let* α9 := borrow α8 (ref str) in
        let* α10 := core.fmt.rt.Argument::["new_display"] α9 in
        let* α11 := borrow [ α10 ] (list core.fmt.rt.Argument) in
        let* α12 := deref α11 (list core.fmt.rt.Argument) in
        let* α13 := borrow α12 (list core.fmt.rt.Argument) in
        let* α14 := pointer_coercion "Unsize" α13 in
        let* α15 := core.fmt.Arguments::["new_v1"] α3 α14 in
        std.io.stdio._print α15 in
      M.alloc tt
    | _ =>
      let* _ :=
        let* α0 :=
          borrow [ mk_str "Don't have Ashley's number.
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := core.fmt.Arguments::["new_const"] α3 in
        std.io.stdio._print α4 in
      M.alloc tt
    end in
  let* _ :=
    let* α0 :=
      borrow_mut
        contacts
        (std.collections.hash.map.HashMap
          (ref str)
          (ref str)
          std.collections.hash.map.RandomState) in
    let* α1 := borrow (mk_str "Ashley") (ref str) in
    let* α2 := deref α1 (ref str) in
    let* α3 := borrow α2 (ref str) in
    (std.collections.hash.map.HashMap K V S)::["remove"] α0 α3 in
  let* α0 :=
    borrow
      contacts
      (std.collections.hash.map.HashMap
        (ref str)
        (ref str)
        std.collections.hash.map.RandomState) in
  let* α1 := (std.collections.hash.map.HashMap K V S)::["iter"] α0 in
  let* α2 :=
    (core.iter.traits.collect.IntoIterator.into_iter
        (Self := (std.collections.hash.map.Iter (ref str) (ref str))))
      α1 in
  let* α3 :=
    match α2 with
    | iter =>
      loop
        (let* _ :=
          let* α0 :=
            borrow_mut
              iter
              (std.collections.hash.map.Iter (ref str) (ref str)) in
          let* α1 :=
            deref α0 (std.collections.hash.map.Iter (ref str) (ref str)) in
          let* α2 :=
            borrow_mut α1 (std.collections.hash.map.Iter (ref str) (ref str)) in
          let* α3 :=
            (core.iter.traits.iterator.Iterator.next
                (Self := (std.collections.hash.map.Iter (ref str) (ref str))))
              α2 in
          match α3 with
          | core.option.Option  =>
            let* α0 := Break in
            never_to_any α0
          | core.option.Option (contact, number) =>
            let* _ :=
              let* _ :=
                let* α0 :=
                  borrow
                    [ mk_str "Calling "; mk_str ": "; mk_str "
" ]
                    (list (ref str)) in
                let* α1 := deref α0 (list (ref str)) in
                let* α2 := borrow α1 (list (ref str)) in
                let* α3 := pointer_coercion "Unsize" α2 in
                let* α4 := borrow contact (ref (ref str)) in
                let* α5 := deref α4 (ref (ref str)) in
                let* α6 := borrow α5 (ref (ref str)) in
                let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
                let* α8 := deref number str in
                let* α9 := borrow α8 str in
                let* α10 := hash_map.call α9 in
                let* α11 := borrow α10 (ref str) in
                let* α12 := deref α11 (ref str) in
                let* α13 := borrow α12 (ref str) in
                let* α14 := core.fmt.rt.Argument::["new_display"] α13 in
                let* α15 := borrow [ α7; α14 ] (list core.fmt.rt.Argument) in
                let* α16 := deref α15 (list core.fmt.rt.Argument) in
                let* α17 := borrow α16 (list core.fmt.rt.Argument) in
                let* α18 := pointer_coercion "Unsize" α17 in
                let* α19 := core.fmt.Arguments::["new_v1"] α3 α18 in
                std.io.stdio._print α19 in
              M.alloc tt in
            M.alloc tt
          end in
        M.alloc tt)
    end in
  use α3.
