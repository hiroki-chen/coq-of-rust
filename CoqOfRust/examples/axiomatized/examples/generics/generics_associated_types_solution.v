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
  Class Trait (Self : Set) : Type := {
    A : Set;
    B : Set;
    contains : (ref ltac:(Self)) -> (ref A.t) -> (ref B.t) -> M bool.t;
    first : (ref ltac:(Self)) -> M i32.t;
    last : (ref ltac:(Self)) -> M i32.t;
    a : (ref ltac:(Self)) -> M A.t;
  }.
  
  Global Instance Method_A `(Trait) : Notations.DoubleColonType Self "A" := {
    Notations.double_colon_type := A;
  }.
  Global Instance Method_B `(Trait) : Notations.DoubleColonType Self "B" := {
    Notations.double_colon_type := B;
  }.
End Contains.
End Contains.

Module  Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container_t.
Section Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container_t.
  Ltac Self := exact generics_associated_types_solution.Container.t.
  
  (*
      type A = i32;
  *)
  Definition A : Set := i32.t.
  
  (*
      type B = i32;
  *)
  Definition B : Set := i32.t.
  
  (*
      fn contains(&self, number_1: &i32, number_2: &i32) -> bool {
          (&self.0 == number_1) && (&self.1 == number_2)
      }
  *)
  Parameter contains :
      (ref ltac:(Self)) -> (ref i32.t) -> (ref i32.t) -> M bool.t.
  
  Global Instance AssociatedFunction_contains :
    Notations.DoubleColon ltac:(Self) "contains" := {
    Notations.double_colon := contains;
  }.
  
  (*
      fn first(&self) -> i32 {
          self.0
      }
  *)
  Parameter first : (ref ltac:(Self)) -> M i32.t.
  
  Global Instance AssociatedFunction_first :
    Notations.DoubleColon ltac:(Self) "first" := {
    Notations.double_colon := first;
  }.
  
  (*
      fn last(&self) -> i32 {
          self.1
      }
  *)
  Parameter last : (ref ltac:(Self)) -> M i32.t.
  
  Global Instance AssociatedFunction_last :
    Notations.DoubleColon ltac:(Self) "last" := {
    Notations.double_colon := last;
  }.
  
  (*
      fn a(&self) -> i32 {
          self.0
      }
  *)
  Parameter a : (ref ltac:(Self)) -> M i32.t.
  
  Global Instance AssociatedFunction_a :
    Notations.DoubleColon ltac:(Self) "a" := {
    Notations.double_colon := a;
  }.
  
  Global Instance ℐ :
    generics_associated_types_solution.Contains.Trait ltac:(Self) := {
    generics_associated_types_solution.Contains.A := A;
    generics_associated_types_solution.Contains.B := B;
    generics_associated_types_solution.Contains.contains := contains;
    generics_associated_types_solution.Contains.first := first;
    generics_associated_types_solution.Contains.last := last;
    generics_associated_types_solution.Contains.a := a;
  }.
End Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container_t.
End Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container_t.

(*
fn difference<C: Contains>(container: &C) -> i32 {
    container.last() - container.first()
}
*)
Parameter difference :
    forall
      {C : Set}
      {ℋ_0 : generics_associated_types_solution.Contains.Trait C},
    (ref C) -> M i32.t.

(*
fn get_a<C: Contains>(container: &C) -> C::A {
    container.a()
}
*)
Parameter get_a :
    forall
      {C : Set}
      {ℋ_0 : generics_associated_types_solution.Contains.Trait C},
    (ref C) -> M C::type["A"].t.

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
