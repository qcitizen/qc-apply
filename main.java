import java.util.*;
import java.lang.Object;

public class Main
{
    public static void main(String[] args) {
 
        System.out.println(compressAlphanumericString("effeac01cb65c")); 
    }

    private static String compressAlphanumericString(String str) {
        // Initialize empty string
        String st = "";
        
        // Remove all the integers from the input string
        st = str.replaceAll("\\d","").toLowerCase();
        
        /* Create a string variable that contains 
         all the chracters for the result */
        StringBuilder result = new StringBuilder("");
        
        /* Creating a HashMap containing char
         as a key and occurrences as  a value */
        LinkedHashMap<Character, Integer> map
                = new LinkedHashMap<Character, Integer>();
        
        // Handle a case where the input is empty        
        if (st.isEmpty()) {
             System.out.println("empty");
         }
        for (int index = 0; index < st.length(); index++){
            char ch = st.charAt(index);
            if (map.containsKey(ch)) {
                map.put(ch, map.get(ch) + 1);
            }
            else {
                map.put(ch, 1);
                char firstKey = map.keySet().iterator().next();
                int firstValue = map.values().iterator().next();
                if (map.size() > 1) {
                    if (firstValue > 1) {
                        result.append(firstKey);
                        result.append(firstValue);
                        map.remove(firstKey);
                    } else {
                        result.append(firstKey);
                        map.remove(firstKey);
                    }
                }
            }
        }
        return result.toString();
    }
}