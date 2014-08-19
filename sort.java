class Sort {
    static int[] array = new int[]{0, 42, 256, 4, 4711, -1337};

    public static void main(String[] args) {
        Sort.fn(0, Sort.array.length-1);

        for(int i : Sort.array) {
            System.out.println(i);
        }
    }

    public static void fn(int offset, int last) {
        if (offset < last) {
            int p = Sort.fn_part(offset, last);
            Sort.fn(offset, p-1);
            Sort.fn(p+1, last);
        }
    }

    public static int fn_part(int offset, int last) {
       int tmp = Sort.array[offset];
       Sort.array[offset] = Sort.array[last];
       Sort.array[last] = tmp;
       for(int i = offset; i <= last; i++) {
            if (Sort.array[i] < Sort.array[last]) {
                tmp = Sort.array[i];
                Sort.array[i] = Sort.array[offset]; 
                Sort.array[offset] = tmp;
                offset++;
            }
       }
       tmp = Sort.array[offset];
       Sort.array[offset] = Sort.array[last];
       Sort.array[last] = tmp;
       return offset;
    }
}
