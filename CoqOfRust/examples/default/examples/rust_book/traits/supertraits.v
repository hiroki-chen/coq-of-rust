(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
(* Empty module 'Person' *)

(* Trait *)
(* Empty module 'Student' *)

(* Trait *)
(* Empty module 'Programmer' *)

(* Trait *)
(* Empty module 'CompSciStudent' *)

(*
fn comp_sci_student_greeting(student: &dyn CompSciStudent) -> String {
    format!(
        "My name is {} and I attend {}. My favorite language is {}. My Git username is {}",
        student.name(),
        student.university(),
        student.fav_language(),
        student.git_username()
    )
}
*)
Definition comp_sci_student_greeting (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ student ] =>
    ltac:(M.monadic
      (let student := M.alloc (| student |) in
      M.read (|
        let res :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "alloc::fmt::format", [] |),
              [
                M.call_closure (|
                  M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                  [
                    (* Unsize *)
                    M.pointer_coercion
                      (M.alloc (|
                        Value.Array
                          [
                            M.read (| Value.String "My name is " |);
                            M.read (| Value.String " and I attend " |);
                            M.read (| Value.String ". My favorite language is " |);
                            M.read (| Value.String ". My Git username is " |)
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
                                [ Ty.path "alloc::string::String" ]
                              |),
                              [
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_trait_method (|
                                      "supertraits::Person",
                                      Ty.dyn [ ("supertraits::CompSciStudent::Trait", []) ],
                                      [],
                                      "name",
                                      []
                                    |),
                                    [ M.read (| student |) ]
                                  |)
                                |)
                              ]
                            |);
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::rt::Argument",
                                "new_display",
                                [ Ty.path "alloc::string::String" ]
                              |),
                              [
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_trait_method (|
                                      "supertraits::Student",
                                      Ty.dyn [ ("supertraits::CompSciStudent::Trait", []) ],
                                      [],
                                      "university",
                                      []
                                    |),
                                    [ M.read (| student |) ]
                                  |)
                                |)
                              ]
                            |);
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::rt::Argument",
                                "new_display",
                                [ Ty.path "alloc::string::String" ]
                              |),
                              [
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_trait_method (|
                                      "supertraits::Programmer",
                                      Ty.dyn [ ("supertraits::CompSciStudent::Trait", []) ],
                                      [],
                                      "fav_language",
                                      []
                                    |),
                                    [ M.read (| student |) ]
                                  |)
                                |)
                              ]
                            |);
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::rt::Argument",
                                "new_display",
                                [ Ty.path "alloc::string::String" ]
                              |),
                              [
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_trait_method (|
                                      "supertraits::CompSciStudent",
                                      Ty.dyn [ ("supertraits::CompSciStudent::Trait", []) ],
                                      [],
                                      "git_username",
                                      []
                                    |),
                                    [ M.read (| student |) ]
                                  |)
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
        res
      |)))
  | _, _ => M.impossible
  end.

(* fn main() {} *)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with | [], [] => ltac:(M.monadic (Value.Tuple [])) | _, _ => M.impossible end.
