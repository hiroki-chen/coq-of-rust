Require Import CoqOfRust.lib.lib.
Require CoqOfRust.core.result.

Module error.
  Module ParseBoolError.
    Parameter t : Set.
  End ParseBoolError.

  Module Utf8Error.
    Parameter t : Set.
  End Utf8Error.
End error.

Module converts.
  (* pub const fn from_utf8(v: &[u8]) -> Result<&str, Utf8Error> *)
  Parameter from_utf8 :
    ref (slice u8.t) ->
    M (result.Result.t (ref str.t) error.Utf8Error.t).
End converts.
