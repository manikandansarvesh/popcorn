package ScubaTraining_Java;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class Sorting {

    public static Set<String> generatePerm(String input)
    {
        Set<String> set = new HashSet<String>();
        if (input == "")
            return set;

        Character a = input.charAt(0);

        if (input.length() > 1)
        {
            input = input.substring(1);

            Set<String> permSet = generatePerm(input);

            for (String x : permSet)
            {
                for (int i = 0; i <= x.length(); i++)
                {
                    set.add(x.substring(0, i) + a + x.substring(i));
                }
            }
        }
        else
        {
            set.add(a + "");
        }
        return set;
    }

    public static void main(String[] args) {
        String a="Thisisgood";
        String b="doog";

        if(a.length()==b.length()) {
            char c[]=a.toCharArray();
            char d[]=b.toCharArray();
            Arrays.sort(c);
            Arrays.sort(d);
            a=new String(c);
            b=new String(d);
            if(a.equals(b))
                System.out.print("Yes");
            else
                System.out.print("No");
        }
        else {
            System.out.print("No");
        }

       Set<String> set= generatePerm("dogisloyalanimal");
        System.out.println(set);
    }
}
