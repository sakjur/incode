# -*- coding: utf-8 -*-
import sys

def locatep(n):
    if n == 2:
        return [2]
    if n < 2:
        return []
    p = [2]
    arr = []
    for i in range(3, n+1, 2):
        arr.append(i)
    while len(arr) > 1 and arr[0]**2 <= n:
        num = arr.pop(0)
        p.append(num)
        red(num, arr)
    p.extend(arr)
    return p

def red(k, arr):
    """Remove combinatorical digits"""
    i = 2
    while k*i <= arr[-1]:
        try:
            arr.remove(k*i)
        except ValueError:
            pass
        i = i+1
    return arr

if len(sys.argv) < 2:
    print(locatep(100))
else:
    print(locatep(int(sys.argv[1])))

