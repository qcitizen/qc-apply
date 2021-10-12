import java.util.*;
import java.lang.Object;

public class Main
{
    public static void main(String[] args) {
        System.out.println(compressAlphanumericString("aaabccccdd")); 
        System.out.println(compressAlphanumericString("aaaaaffffffffffc")); 
        System.out.println(compressAlphanumericString("abcd")); 
        System.out.println(compressAlphanumericString("ccceee12eccceee")); 
        System.out.println(compressAlphanumericString("effeac01cb65c")); 
        System.out.println(compressAlphanumericString("12345IAmABoy12345"));
        System.out.println(compressAlphanumericString("")); 
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
            // if the character already exists in map
            if (map.containsKey(ch)) {
                // Increment a given key's value by 1
                map.put(ch, map.get(ch) + 1);
            } else {
                // Add a new key as a character and set value to 1
                map.put(ch, 1);
                
                // Retrieve map's first key
                char firstKey = map.keySet().iterator().next();
                
                // Retrieve map's first value
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
        
        // Add remainder element from map to result string 
        if (map.size() > 0) {
            result.append(map.keySet().iterator().next());      
            if (map.values().iterator().next() > 1) {
                result.append(map.values().iterator().next());      
            }
        }
        return result.toString();
    }