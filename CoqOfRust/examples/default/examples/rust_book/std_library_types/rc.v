(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let rc_examples = "Rc examples".to_string();
    {
        println!("--- rc_a is created ---");

        let rc_a: Rc<String> = Rc::new(rc_examples);
        println!("Reference Count of rc_a: {}", Rc::strong_count(&rc_a));

        {
            println!("--- rc_a is cloned to rc_b ---");

            let rc_b: Rc<String> = Rc::clone(&rc_a);
            println!("Reference Count of rc_b: {}", Rc::strong_count(&rc_b));
            println!("Reference Count of rc_a: {}", Rc::strong_count(&rc_a));

            // Two `Rc`s are equal if their inner values are equal
            println!("rc_a and rc_b are equal: {}", rc_a.eq(&rc_b));

            // We can use methods of a value directly
            println!("Length of the value inside rc_a: {}", rc_a.len());
            println!("Value of rc_b: {}", rc_b);

            println!("--- rc_b is dropped out of scope ---");
        }

        println!("Reference Count of rc_a: {}", Rc::strong_count(&rc_a));

        println!("--- rc_a is dropped out of scope ---");
    }

    // Error! `rc_examples` already moved into `rc_a`
    // And when `rc_a` is dropped, `rc_examples` is dropped together
    // println!("rc_examples: {}", rc_examples);
    // TODO ^ Try uncommenting this line
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* rc_examples :=
      let* α0 :=
        M.get_method
          "alloc::string::ToString"
          "to_string"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "Rc examples") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "--- rc_a is created ---
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" (borrow α2) ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* rc_a :=
      let* α0 := M.read rc_examples in
      let* α1 :=
        M.call
          (Ty.apply
              (Ty.path "alloc::rc::Rc")
              [ Ty.path "alloc::string::String"; Ty.path "alloc::alloc::Global"
              ])::["new"]
          [ α0 ] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Reference Count of rc_a: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.apply
                (Ty.path "alloc::rc::Rc")
                [
                  Ty.path "alloc::string::String";
                  Ty.path "alloc::alloc::Global"
                ])::["strong_count"]
            [ borrow rc_a ] in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow α5 ] in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α3);
              pointer_coercion "Unsize" (borrow α7)
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "--- rc_a is cloned to rc_b ---
") in
          let* α2 := M.alloc [ α1 ] in
          let* α3 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_const"]
              [ pointer_coercion "Unsize" (borrow α2) ] in
          let* α4 := M.call α0 [ α3 ] in
          M.alloc α4 in
        M.alloc tt in
      let* rc_b :=
        let* α0 :=
          M.get_method
            "core::clone::Clone"
            "clone"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "alloc::rc::Rc")
                  [
                    Ty.path "alloc::string::String";
                    Ty.path "alloc::alloc::Global"
                  ]
            ] in
        let* α1 := M.call α0 [ borrow rc_a ] in
        M.alloc α1 in
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "Reference Count of rc_b: ") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α1; α2 ] in
          let* α4 :=
            M.call
              (Ty.apply
                  (Ty.path "alloc::rc::Rc")
                  [
                    Ty.path "alloc::string::String";
                    Ty.path "alloc::alloc::Global"
                  ])::["strong_count"]
              [ borrow rc_b ] in
          let* α5 := M.alloc α4 in
          let* α6 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow α5 ] in
          let* α7 := M.alloc [ α6 ] in
          let* α8 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α3);
                pointer_coercion "Unsize" (borrow α7)
              ] in
          let* α9 := M.call α0 [ α8 ] in
          M.alloc α9 in
        M.alloc tt in
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "Reference Count of rc_a: ") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α1; α2 ] in
          let* α4 :=
            M.call
              (Ty.apply
                  (Ty.path "alloc::rc::Rc")
                  [
                    Ty.path "alloc::string::String";
                    Ty.path "alloc::alloc::Global"
                  ])::["strong_count"]
              [ borrow rc_a ] in
          let* α5 := M.alloc α4 in
          let* α6 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow α5 ] in
          let* α7 := M.alloc [ α6 ] in
          let* α8 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α3);
                pointer_coercion "Unsize" (borrow α7)
              ] in
          let* α9 := M.call α0 [ α8 ] in
          M.alloc α9 in
        M.alloc tt in
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "rc_a and rc_b are equal: ") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α1; α2 ] in
          let* α4 :=
            M.get_method
              "core::cmp::PartialEq"
              "eq"
              [
                (* Self *)
                  Ty.apply
                    (Ty.path "alloc::rc::Rc")
                    [
                      Ty.path "alloc::string::String";
                      Ty.path "alloc::alloc::Global"
                    ];
                (* Rhs *)
                  Ty.apply
                    (Ty.path "alloc::rc::Rc")
                    [
                      Ty.path "alloc::string::String";
                      Ty.path "alloc::alloc::Global"
                    ]
              ] in
          let* α5 := M.call α4 [ borrow rc_a; borrow rc_b ] in
          let* α6 := M.alloc α5 in
          let* α7 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow α6 ] in
          let* α8 := M.alloc [ α7 ] in
          let* α9 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α3);
                pointer_coercion "Unsize" (borrow α8)
              ] in
          let* α10 := M.call α0 [ α9 ] in
          M.alloc α10 in
        M.alloc tt in
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "Length of the value inside rc_a: ") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α1; α2 ] in
          let* α4 :=
            M.get_method
              "core::ops::deref::Deref"
              "deref"
              [
                (* Self *)
                  Ty.apply
                    (Ty.path "alloc::rc::Rc")
                    [
                      Ty.path "alloc::string::String";
                      Ty.path "alloc::alloc::Global"
                    ]
              ] in
          let* α5 := M.call α4 [ borrow rc_a ] in
          let* α6 := M.call (Ty.path "alloc::string::String")::["len"] [ α5 ] in
          let* α7 := M.alloc α6 in
          let* α8 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow α7 ] in
          let* α9 := M.alloc [ α8 ] in
          let* α10 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α3);
                pointer_coercion "Unsize" (borrow α9)
              ] in
          let* α11 := M.call α0 [ α10 ] in
          M.alloc α11 in
        M.alloc tt in
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "Value of rc_b: ") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α1; α2 ] in
          let* α4 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow rc_b ] in
          let* α5 := M.alloc [ α4 ] in
          let* α6 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α3);
                pointer_coercion "Unsize" (borrow α5)
              ] in
          let* α7 := M.call α0 [ α6 ] in
          M.alloc α7 in
        M.alloc tt in
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "--- rc_b is dropped out of scope ---
") in
          let* α2 := M.alloc [ α1 ] in
          let* α3 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_const"]
              [ pointer_coercion "Unsize" (borrow α2) ] in
          let* α4 := M.call α0 [ α3 ] in
          M.alloc α4 in
        M.alloc tt in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Reference Count of rc_a: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.apply
                (Ty.path "alloc::rc::Rc")
                [
                  Ty.path "alloc::string::String";
                  Ty.path "alloc::alloc::Global"
                ])::["strong_count"]
            [ borrow rc_a ] in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow α5 ] in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α3);
              pointer_coercion "Unsize" (borrow α7)
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "--- rc_a is dropped out of scope ---
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" (borrow α2) ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
