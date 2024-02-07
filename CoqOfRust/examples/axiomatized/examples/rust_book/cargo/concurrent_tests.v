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
Parameter foo : forall {A : Set}, (core.option.Option.t A) -> M unit.

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
  Parameter test_file : M unit.
  
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
  Parameter test_file_also : M unit.
End tests.
