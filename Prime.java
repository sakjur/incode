import java.util.ArrayList;
import java.util.List;
import java.lang.Math;

public class Prime {
    public static void main(String[] args) {
        if(args.length < 1)
            printList(locatep(100));
        else {
            try {
                int max = Integer.parseInt(args[0]);
                printList(locatep(max));
            }
            catch (NumberFormatException e) {
                System.out.println("\"" + args[0] + "\" is not a number");
            }
        }
    }

    private static void printList(List<Integer> list) {
        for(int i = 0; i <list.size(); i++) {
            System.out.println(list.get(i));
        }
    }

    private static List<Integer> locatep(int n) {
        List<Integer> list = new ArrayList<Integer>();
        List<Integer> list2 = new ArrayList<Integer>();

        if (n <=2) {
            for(int i = 0; i < n; i++)
                list.add(i);
            return list;
        }
        
        for(int i = 3; i <= n; i+=2) {
            list.add(i);
        }

        while(list.size() > 1 && Math.pow(list.get(0), 2) <= n) {
            int num = list.get(0);
            list.remove(0);
            list2.add(num);
            list = red(num, list);
        }
        
        list.add(0, 2);
        list.addAll(1, list2);

        return list;
    }

    private static List<Integer> red(int k, List<Integer> list) {
        int i = 2;

        while(k*i <= list.get(list.size() - 1)) {
            list.remove(new Integer(k*i));
            i += 1;
        }

        return list;
    }
}
