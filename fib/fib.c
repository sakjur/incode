#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define FST_VAL 1

void main(int argc, char * argv[])
{
    if (argc <= 1)
        exit(EINVAL);
    
    if (argv[1] == "0")
    {
        printf("%i\n", FST_VAL);
        exit(0);
    }

    uint64_t curr = FST_VAL;
    uint64_t prev = 0;

    for(uint64_t i = 1; i <= atoi(argv[1]); i++)
    {
        uint64_t t = curr;
        curr = prev + curr;
        prev = t;
    }

    printf("%lu\n", curr);
    exit(0);
}

