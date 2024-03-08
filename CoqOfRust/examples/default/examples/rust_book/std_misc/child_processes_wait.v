(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut child = Command::new("sleep").arg("5").spawn().unwrap();
    let _result = child.wait().unwrap();

    println!("reached end of main");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* child :=
      let* α0 := M.read (mk_str "sleep") in
      let* α1 := M.call (Ty.path "std::process::Command")::["new"] [ α0 ] in
      let* α2 := M.alloc α1 in
      let* α3 := M.read (mk_str "5") in
      let* α4 := M.call (Ty.path "std::process::Command")::["arg"] [ α2; α3 ] in
      let* α5 := M.call (Ty.path "std::process::Command")::["spawn"] [ α4 ] in
      let* α6 :=
        M.call
          (Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "std::process::Child"; Ty.path "std::io::error::Error"
              ])::["unwrap"]
          [ α5 ] in
      M.alloc α6 in
    let* _result :=
      let* α0 := M.call (Ty.path "std::process::Child")::["wait"] [ child ] in
      let* α1 :=
        M.call
          (Ty.apply
              (Ty.path "core::result::Result")
              [
                Ty.path "std::process::ExitStatus";
                Ty.path "std::io::error::Error"
              ])::["unwrap"]
          [ α0 ] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "reached end of main
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ M.pointer_coercion "Unsize" α2 ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
