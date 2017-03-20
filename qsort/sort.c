#include <stdio.h>
#include <stdlib.h>

void swap(int *a, int *b) {
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

int fn(int * arrayv, int offset, int last);
int fn_part(int * arrayv, int offset, int last);

int main (char * argv, int argc) {
    int array[] = {0, 42, 256, 4, 4711, -1337};
    fn(array, 0, 5);

    for (int i = 0; i <= 5; i++)
        printf("array[%i] is: %i\n", i, array[i]);
}

int fn (int * arrayv, int offset, int last) {
    if (offset < last) {
        int p = fn_part(arrayv, offset, last);
        fn(arrayv, offset, p-1);
        fn(arrayv, p+1, last);
    }
}

int fn_part(int * arrayv, int offset, int last) {
    int i;
    int pivot = offset;
    swap(&arrayv[last], &arrayv[pivot]);
    int storeIndex = offset;
    for (i = offset; i <= last; i++) {
        if (arrayv[i] < arrayv[last]) {
            swap(&arrayv[i], &arrayv[storeIndex]);
            storeIndex++;
        }
        
    }
    swap(&arrayv[storeIndex], &arrayv[last]);
    return storeIndex;
}

