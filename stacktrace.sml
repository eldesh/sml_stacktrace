
(*
 * stack trace sample module
 *)
structure StackTrace =
struct
  fun error () = (raise Fail "error!";())
  fun wrap1 () = error ()
  fun wrap2 () = wrap1 ()
  fun wrap3 () = wrap2 ()
  fun wrap4 () = wrap3 ()

  fun println s = print (s^"\n")

  fun main' (name, argv) =
    (println name;
     app println argv;
     wrap4();
     OS.Process.success
    )

  fun main (name, argv) =
    BackTrace.monitor(fn () => main'(name, argv))
end

