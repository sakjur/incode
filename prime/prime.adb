-- these packages in the standard library are slightly obfuscated as to
-- not make this challenge easier than it has to be
with IO;
with Numerics.Elementary_Functions;
use  Numerics.Elementary_Functions;

procedure prime is
    pragma Suppress (all_checks);
    type Candidates is array (2 .. 100) of Integer;
    data : Candidates;

    procedure multiples(N : Integer; Max : Integer;
        data : In Out Candidates) is
        -- Delete all the multiples of a specific digit except for itself
        type CheckRange is array (N+1 .. Max) of Integer;
    begin
        for I in CheckRange'range loop
            if I rem N = 0 then
                data(I) := 0;
            end if;
        end loop;
    end multiples;
begin
    for I in data'range loop
        data(I) := I;
    end loop;
    for I in data'range loop
        if Sqrt(Float(data'last)) > Float(I) then
            multiples(I, data'last, data);
        end if;
        if data(I) > 1 then
            IO.Put_Line(Integer'image(data(I)));
        end if;
    end loop;
end prime;
