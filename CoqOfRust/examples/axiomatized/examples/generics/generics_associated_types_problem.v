(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Container.
Section Container.
  Record t : Set := {
    x0 : i32.t;
    x1 : i32.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
  Global Instance Get_1 : Notations.Dot "1" := {
    Notations.dot := Ref.map (fun x => x.(x1)) (fun v x => x <| x1 := v |>);
  }.
End Container.
End Container.

Module  Contains.
Section Contains.
  Class Trait (Self : Set) {A B : Set} : Type := {
    contains : (ref Self) -> (ref A) -> (ref B) -> M bool.t;
    first : (ref Self) -> M i32.t;
    last : (ref Self) -> M i32.t;
  }.
  
End Contains.
End Contains.

Module  Impl_generics_associated_types_problem_Contains_i32_t_i32_t_for_generics_associated_types_problem_Container_t.
Section Impl_generics_associated_types_problem_Contains_i32_t_i32_t_for_generics_associated_types_problem_Container_t.
  Definition Self : Set := generics_associated_types_problem.Container.t.
  
  (*
      fn contains(&self, number_1: &i32, number_2: &i32) -> bool {
          (&self.0 == number_1) && (&self.1 == number_2)
      }
  *)
  Parameter contains : (ref Self) -> (ref i32.t) -> (ref i32.t) -> M bool.t.
  
  Global Instance AssociatedFunction_contains :
    Notations.DoubleColon Self "contains" := {
    Notations.double_colon := contains;
  }.
  
  (*
      fn first(&self) -> i32 {
          self.0
      }
  *)
  Parameter first : (ref Self) -> M i32.t.
  
  Global Instance AssociatedFunction_first :
    Notations.DoubleColon Self "first" := {
    Notations.double_colon := first;
  }.
  
  (*
      fn last(&self) -> i32 {
          self.1
      }
  *)
  Parameter last : (ref Self) -> M i32.t.
  
  Global Instance AssociatedFunction_last :
    Notations.DoubleColon Self "last" := {
    Notations.double_colon := last;
  }.
  
  Global Instance ℐ :
    generics_associated_types_problem.Contains.Trait Self
      (A := i32.t)
      (B := i32.t) := {
    generics_associated_types_problem.Contains.contains := contains;
    generics_associated_types_problem.Contains.first := first;
    generics_associated_types_problem.Contains.last := last;
  }.
End Impl_generics_associated_types_problem_Contains_i32_t_i32_t_for_generics_associated_types_problem_Container_t.
End Impl_generics_associated_types_problem_Contains_i32_t_i32_t_for_generics_associated_types_problem_Container_t.

(*
fn difference<A, B, C>(container: &C) -> i32
where
    C: Contains<A, B>,
{
    container.last() - container.first()
}
*)
Parameter difference :
    forall
      {A B C : Set}
      {ℋ_0 :
        generics_associated_types_problem.Contains.Trait C (A := A) (B := B)},
    (ref C) -> M i32.t.

(*
fn main() {
    let number_1 = 3;
    let number_2 = 10;

    let container = Container(number_1, number_2);

    println!(
        "Does container contain {} and {}: {}",
        &number_1,
        &number_2,
        container.contains(&number_1, &number_2)
    );
    println!("First number: {}", container.first());
    println!("Last number: {}", container.last());

    println!("The difference is: {}", difference(&container));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M unit.
