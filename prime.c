#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct numberlist {
    int val;
    struct numberlist * next;
} numli;

numli* find_primes(int);
numli* multiples(int, int); 
void delete_from_list(numli* list, numli* remove);

int main(int argc, char *argv[]) {
    numli* current = 0;
    if (argc < 2)
        current = find_primes(100);
    else
        current = find_primes(atoi(argv[1]));
    while(current) {
        numli* prev = current;
        printf("%d\n", current->val);
        current = prev->next;
        free(prev);
    }
    return 0;
}

numli* find_primes(int n) {
    if (n < 2)
        return 0;
    numli* first = (numli*) malloc(sizeof(numli));
    numli* curr = first;
    first->val = 2;
    first->next = 0;
    for (int i = 3; i <= n; i=i+2) {
        numli* prev = curr;
        curr = (numli*) malloc(sizeof(numli));
        prev->next = curr;
        curr->val = i; 
        curr->next = 0;
    }
    curr = first->next;
    while (curr && curr->val <= sqrt(n))
    {
        delete_from_list(first, multiples(curr->val, n));
        curr = curr->next;
    }
    return first;
}

void delete_from_list(numli* first, numli* remove_first) {
    numli* current = first;
    numli* prevprev = first;
    numli* remove = remove_first;
    while (current && remove) {
        if (current->val > remove->val) {
            remove = remove->next;
            if (!remove)
                break;
        }
        if (current->val == remove->val) {
            numli* prev = current;
            current = current->next;
            if (prevprev)
                prevprev->next = current;
            free(prev);
        }
        else
        {
            prevprev = current;
            current = current->next;
        }
    }
    remove = remove_first;
    while(remove) {
        numli* oldrem = remove;
        remove = remove->next;
        free(oldrem);
    }
}

numli* multiples(int m, int max) {
    numli* first = (numli*) malloc(sizeof(numli));
    numli* curr = first;
    first->val = 3*m;
    first->next = 0;
    for(int i = 5; m*i <= max; i = i+2) {
        numli* prev = curr;    
        curr = (numli*) malloc(sizeof(numli));
        prev->next = curr;
        curr->val = m*i;
        curr->next = 0;
    }
    return first;
}

