       identification division.
       program-id.     prime.
       author.         Emil Tullstedt.
       date-written.   May 29 2015.
      * "Let's all get up and dance to a song that was a hit before your
      * mother was born, though she was born a long, long time ago. Your
      * mother should know, your mother should know"
       data division.
           working-storage section.
           01 counter pic 9(5).
           01 ic pic 9(5).
           01 divid pic 9(5).
           01 rem pic 9(5).
           01 primecand.
               05 primecandidates occurs 100 times.
                   10 ws-c pic 9(5) value 00555.
      * Line below signals where the array stops            
               05 endoflist pic x(5) value "wseol".

       procedure division.
      * I think I could do this in the data division, but can't figure
      * out how... :(
        perform varying counter from 1 by 1 until
        primecandidates(counter) is equal to "wseol"
           set primecandidates(counter) to counter
           end-perform
        set primecandidates(1) to 0
      * Magic stuff!
        perform varying counter from 3 by 1 until
        primecandidates(counter) is equal to "wseol"
           perform varying ic from 2 by 1 until
           ic is equal to counter
               divide primecandidates(ic) into
               primecandidates(counter) giving divid remainder rem
               if rem is equal to 0
                   set primecandidates(counter) to 0
               end-if
           end-perform
        end-perform
      * Printing display stuff
        perform varying counter from 1 by 1 until
        primecandidates(counter) is equal to "wseol"
           if primecandidates(counter) is not equal to 0
               display primecandidates(counter)
           end-if
        end-perform
       stop run.
