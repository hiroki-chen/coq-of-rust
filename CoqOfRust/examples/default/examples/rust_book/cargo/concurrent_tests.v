(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn foo<A>(o: Option<A>) {
    match o {
        Some(_a) => println!("some"),
        None => println!("nothing"),
    }
}
*)
Definition foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ A ], [ o ] =>
    let* o := M.alloc o in
    let* α0 :=
      match_operator
        o
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.Some _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::option::Option::Get_Some_0" in
                M.pure (α0 γ) in
              let* _a := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "some
") in
                let* α2 := M.alloc [ α1 ] in
                let* α3 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ pointer_coercion "Unsize" α2 ] in
                let* α4 := M.call α0 [ α3 ] in
                M.alloc α4 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.option.Option.None =>
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "nothing
") in
                let* α2 := M.alloc [ α1 ] in
                let* α3 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ pointer_coercion "Unsize" α2 ] in
                let* α4 := M.call α0 [ α3 ] in
                M.alloc α4 in
              M.alloc tt
            | _ => M.break_match 
            end)
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

Module tests.
  (*
      fn test_file() {
          // Opens the file ferris.txt or creates one if it doesn't exist.
          let mut file = OpenOptions::new()
              .append(true)
              .create(true)
              .open("ferris.txt")
              .expect("Failed to open ferris.txt");
  
          // Print "Ferris" 5 times.
          for _ in 0..5 {
              file.write_all("Ferris\n".as_bytes())
                  .expect("Could not write to ferris.txt");
          }
      }
  *)
  Definition test_file (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* file :=
        let* α0 := M.call (Ty.path "std::fs::OpenOptions")::["new"] [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call (Ty.path "std::fs::OpenOptions")::["append"] [ α1; true ] in
        let* α3 :=
          M.call (Ty.path "std::fs::OpenOptions")::["create"] [ α2; true ] in
        let* α4 := M.read (mk_str "ferris.txt") in
        let* α5 :=
          M.call (Ty.path "std::fs::OpenOptions")::["open"] [ α3; α4 ] in
        let* α6 := M.read (mk_str "Failed to open ferris.txt") in
        let* α7 :=
          M.call
            (Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "std::fs::File"; Ty.path "std::io::error::Error"
                ])::["expect"]
            [ α5; α6 ] in
        M.alloc α7 in
      let* α0 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ]
          ] in
      let* α1 :=
        M.call
          α0
          [
            Value.StructRecord
              "core::ops::range::Range"
              [
                ("start", (Integer.of_Z 0) : Ty.path "i32");
                ("end_", (Integer.of_Z 5) : Ty.path "i32")
              ]
          ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        match_operator
          α2
          [
            fun γ =>
              (let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_method
                      "core::iter::traits::iterator::Iterator"
                      "next"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::ops::range::Range")
                            [ Ty.path "i32" ]
                      ] in
                  let* α1 := M.call α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.None =>
                          let* α0 := M.break in
                          let* α1 := M.read α0 in
                          let* α2 := never_to_any α1 in
                          M.alloc α2
                        | _ => M.break_match 
                        end);
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.Some _ =>
                          let* γ0_0 :=
                            let* α0 :=
                              M.var "core::option::Option::Get_Some_0" in
                            M.pure (α0 γ) in
                          let* _ :=
                            let* α0 :=
                              M.get_method
                                "std::io::Write"
                                "write_all"
                                [ (* Self *) Ty.path "std::fs::File" ] in
                            let* α1 := M.read (mk_str "Ferris
") in
                            let* α2 :=
                              M.call (Ty.path "str")::["as_bytes"] [ α1 ] in
                            let* α3 := M.call α0 [ file; α2 ] in
                            let* α4 :=
                              M.read (mk_str "Could not write to ferris.txt") in
                            let* α5 :=
                              M.call
                                (Ty.apply
                                    (Ty.path "core::result::Result")
                                    [
                                      Ty.tuple [];
                                      Ty.path "std::io::error::Error"
                                    ])::["expect"]
                                [ α3; α4 ] in
                            M.alloc α5 in
                          M.alloc tt
                        | _ => M.break_match 
                        end)
                    ] in
                M.alloc tt))
          ] in
      M.read (use α3)
    | _, _ => M.impossible
    end.
  
  (*
      fn test_file_also() {
          // Opens the file ferris.txt or creates one if it doesn't exist.
          let mut file = OpenOptions::new()
              .append(true)
              .create(true)
              .open("ferris.txt")
              .expect("Failed to open ferris.txt");
  
          // Print "Corro" 5 times.
          for _ in 0..5 {
              file.write_all("Corro\n".as_bytes())
                  .expect("Could not write to ferris.txt");
          }
      }
  *)
  Definition test_file_also (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* file :=
        let* α0 := M.call (Ty.path "std::fs::OpenOptions")::["new"] [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call (Ty.path "std::fs::OpenOptions")::["append"] [ α1; true ] in
        let* α3 :=
          M.call (Ty.path "std::fs::OpenOptions")::["create"] [ α2; true ] in
        let* α4 := M.read (mk_str "ferris.txt") in
        let* α5 :=
          M.call (Ty.path "std::fs::OpenOptions")::["open"] [ α3; α4 ] in
        let* α6 := M.read (mk_str "Failed to open ferris.txt") in
        let* α7 :=
          M.call
            (Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "std::fs::File"; Ty.path "std::io::error::Error"
                ])::["expect"]
            [ α5; α6 ] in
        M.alloc α7 in
      let* α0 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ]
          ] in
      let* α1 :=
        M.call
          α0
          [
            Value.StructRecord
              "core::ops::range::Range"
              [
                ("start", (Integer.of_Z 0) : Ty.path "i32");
                ("end_", (Integer.of_Z 5) : Ty.path "i32")
              ]
          ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        match_operator
          α2
          [
            fun γ =>
              (let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_method
                      "core::iter::traits::iterator::Iterator"
                      "next"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::ops::range::Range")
                            [ Ty.path "i32" ]
                      ] in
                  let* α1 := M.call α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.None =>
                          let* α0 := M.break in
                          let* α1 := M.read α0 in
                          let* α2 := never_to_any α1 in
                          M.alloc α2
                        | _ => M.break_match 
                        end);
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.Some _ =>
                          let* γ0_0 :=
                            let* α0 :=
                              M.var "core::option::Option::Get_Some_0" in
                            M.pure (α0 γ) in
                          let* _ :=
                            let* α0 :=
                              M.get_method
                                "std::io::Write"
                                "write_all"
                                [ (* Self *) Ty.path "std::fs::File" ] in
                            let* α1 := M.read (mk_str "Corro
") in
                            let* α2 :=
                              M.call (Ty.path "str")::["as_bytes"] [ α1 ] in
                            let* α3 := M.call α0 [ file; α2 ] in
                            let* α4 :=
                              M.read (mk_str "Could not write to ferris.txt") in
                            let* α5 :=
                              M.call
                                (Ty.apply
                                    (Ty.path "core::result::Result")
                                    [
                                      Ty.tuple [];
                                      Ty.path "std::io::error::Error"
                                    ])::["expect"]
                                [ α3; α4 ] in
                            M.alloc α5 in
                          M.alloc tt
                        | _ => M.break_match 
                        end)
                    ] in
                M.alloc tt))
          ] in
      M.read (use α3)
    | _, _ => M.impossible
    end.
End tests.
