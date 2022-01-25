package ScubaTraining_Java;

import java.util.Arrays;
import java.util.Vector;

public class StringMerge {
    static boolean isPossible(Vector<String> v, String str)
    {

        // Sort the given string
        str = sortString(str);

        // Select two strings at a time from given vector
        for (int i = 0; i < v.size() - 1; i++)
        {
            for (int j = i + 1; j < v.size(); j++)
            {

                // Get the concatenated string
                String temp = v.get(i) + v.get(j);

                // Sort the resultant string
                temp = sortString(temp);

                // If the resultant string is equal
                // to the given string str
                if (temp.compareTo(str) == 0)
                {
                    return true;
                }
            }
        }

        // No valid pair found
        return false;
    }

    // Method to sort a string alphabetically
    public static String sortString(String inputString)
    {
        // convert input string to char array
        char tempArray[] = inputString.toCharArray();

        // sort tempArray
        Arrays.sort(tempArray);

        // return new sorted string
        return new String(tempArray);
    }

    // Driver code
    public static void main(String[] args)
    {
        String str = "amazon";
        String []arr = { "fds", "oxq", "zoa", "epw", "amn" };
        Vector<String> v = new Vector<String>(Arrays.asList(arr));

        if (isPossible(v, str))
            System.out.println("Yes");
        else
            System.out.println("No");
       // Arrays.sort(str);
    }
}

