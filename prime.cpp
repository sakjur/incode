#include <list>
#include <math.h>
#include <iostream>
                                                                                        
using namespace std;



list<int> reduce(int n, list<int> l){
    int i = 1;

    while(n*i <= l.back()) {
        l.remove(n*i);
        i++;
    }

    return l;
}

list<int> locatePrimes(int n){
    list<int> primes;
    list<int> list;
    int i;
    if(n<=2){
        for(i = 0; i<n; i++)
            primes.push_back(i);
        return primes;
    }                                                                                           

    primes.push_back(2);
    for(i = 3; i <= n;){
        primes.push_back(i);
        i+=2;
    }
    
    while(primes.size()>0 && pow(primes.front(), 2) <= n) {
        
        int num = primes.front();
        primes.pop_front();
        list.push_back(num);
        primes = reduce(num, primes);
    }
    list.splice(list.end(), primes);
    return list;
}



int main(int argc, char **argv){

    list<int> primes = locatePrimes(100);
    int i=0;
    cout << "[";

    while(primes.size() > 0) {
        cout << primes.front();
        if(primes.size() != 1)
            cout << ", ";

        primes.pop_front();
    }
    cout << "]" << endl;
    return 0;
}
