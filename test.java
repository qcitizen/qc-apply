

public class Main
{
  public static void main (String[]args)
  {

    String text = "mmmmooooobiilllee";
    String out = "";

    int count = 1;
    for (int i = 0; i < text.length (); i++)
      {

	count = 1;
	while (i < text.length () - 1
	       && text.charAt (i) == text.charAt (i + 1))
	  {
	    count++;
	    i++;
	  }
	out = out + text.charAt (i) + count;
      }
    System.out.println ("output string : " + out);

  }
}
