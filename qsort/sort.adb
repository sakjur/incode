with IO;

procedure sort is
    pragma Suppress (all_checks);
    type Number_List is array (Positive range <>) of Integer;
    data : Number_List := (0, 42, 256, 4, 4711, -1337);

    function Fn_part(Offset : In Integer; Last : In Integer) return Integer is
        Index : Integer := Offset;
        temporary : Integer;
    begin
        temporary := data(Last);
        data(Last) := data(Index);
        data(Index) := temporary;
        for I in Integer range Index .. Last loop
            if data(I) < data(Last) then
                temporary := data(I);
                data(I) := data(Index);
                data(Index) := temporary;
                Index := Index + 1;
            end if;
        end loop;
        temporary := data(Last);
        data(Last) := data(Index);
        data(Index) := temporary;
        return Index;
    end Fn_part;

    procedure Fn (Offset : In Integer; Last : In Integer) is
        Pi : Integer;
    begin
        if Offset < Last then
            Pi := Fn_part(Offset, Last);
            Fn(Offset, Pi-1);
            Fn(Pi+1, Last);
        end if;
    end Fn;

begin
    Fn(1, data'length);
    for I in Integer range 1 .. data'length loop
        IO.Put_Line(Integer'Image(data(I)));
    end loop;
end sort;
