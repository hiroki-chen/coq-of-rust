(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Color *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Red";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Blue";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Green";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "RGB";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "HSV";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "HSL";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "CMY";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "CMYK";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      }
    ];
} *)

Parameter main : (list Ty.t) -> (list Value.t) -> M.
