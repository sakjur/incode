-module(decibyte).
-export([run/1]).

run(L) ->
  run(L, 0, 0).

run([H | T], Sum, FilesProcessed) ->
  case filelib:file_size(H) of
    0 ->
      io:fwrite("File not found: ~s~n", [H]);
    Filesize ->
      io:fwrite("~9.2fdBy ~s~n", [decibyte(Filesize), H]),
      run(T, Sum + Filesize, FilesProcessed + 1)
  end;
run([], Sum, FilesProcessed) ->
  case FilesProcessed of
    0 -> io:fwrite("Provide one or more filenames in the list to get decibytes~n"),
         err;
    1 -> ok;
    _ -> io:fwrite("~9.2fdBy === TOTAL ===~n", [decibyte(Sum)]),
         ok
  end.

decibyte(Size) ->
  float(math:log10(Size) * 10).
