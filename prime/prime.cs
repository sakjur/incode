using System;
using System.Collections.Generic;

public class Prime {
    public static void Main(string[] args) {
        if(args.Length < 1) {
            printList(locatep(100));
        }
        else {
            try {
                int max = Convert.ToInt32(args[0]);
                printList(locatep(max));
            }
            catch (FormatException e) {
                Console.WriteLine("\""  + args[0] + "\" is not a number");
            }
        }
    }

    private static void printList(List<int> list) {
        Console.Write("[");
        for(int i = 0; i < list.Count; i++) {
            Console.Write(list[i]);

            if(i != list.Count - 1)
                Console.Write(", ");
        }
        Console.Write("]\n");
    }

    private static List<int> locatep(int n) {
        List<int> list = new List<int>();
        List<int> list2 = new List<int>();

        if(n < 2) {
            return list;
        }
        if(n == 2) {
            list.Add(2);
            return list;
        }

        for(int i = 3; i <= n; i+=2) {
            list.Add(i);
        }

        while(list.Count > 1 && Math.Pow(list[0], 2) <= n) {
            int num = list[0];
            list.RemoveAt(0);
            list2.Add(num);
            list = red(num, list);
        }

        list.Insert(0, 2);
        list.InsertRange(1, list2);

        return list;
    }

    private static List<int> red(int k, List<int> list) {
        int i = 2;

        while(k*i <= list[list.Count - 1]) {
            list.Remove(i*k);
            i += 1;
        }

        return list;
    }
}
