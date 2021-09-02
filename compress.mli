val compress : string -> string
(** [compress input] is [input] compressed according to the following
    rules:
 
   - Consecutive matching characters are compressed to the character and
     the number of times it is repeated. Ex: aaa -> a3
   - Unique characters are retained as-is. Ex: a -> a.
 *)
