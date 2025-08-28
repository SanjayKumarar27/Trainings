// See https://aka.ms/new-console-template for more information

using System.Threading.Tasks.Dataflow;

class First
{
    public static void Main()
    {
        // Console.Write("Hello KPMG");
        //  Console.WriteLine("Hello KPMG");

        //variables

        // string name = "Sanjay";
        //Differnt type of concatatination is Csharp
        //  Console.WriteLine("Your name is "+name);
        //  Console.WriteLine("Your name is {1}",name,2);//reommended 0 here is the parameter number 
        //  Console.WriteLine($"Your name is {name}");//new

        //  Console.WriteLine("Hello World" );
        //take user name,city ,qualification 
        //Reading inputs from the user

        // string? name;//? means its nullable can be null
        // Console.WriteLine("Enter Your name");
        // name = Console.ReadLine();
        // string? city;
        // Console.WriteLine("Enter Your city");
        // city = Console.ReadLine();
        // string? qualification;
        // Console.WriteLine("Enter Your Qualifiaction ");
        // qualification = Console.ReadLine();


        // Console.WriteLine("--------------------");
        // Console.WriteLine("Your Details are \n Name {0} \n City {1} \n Qualification {2}", name, city, qualification);


        // Console.Write("Enter age ");
        // int age = Convert.ToInt32(Console.ReadLine());//Not recommended as int is lager size and this convert will not be able to convert char to int
        // int? age = int.Parse(Console.ReadLine()); 

        // int age;
        // bool res=int.TryParse(Console.ReadLine(),out age); //this return a boolean used 
        // Console.Write("{0},{1}",age, res);

        // byte age;
        // byte.TryParse(Console.ReadLine(), out age);//this return a boolean used 


        //     if (age > 18)
        //     {

        //         Console.Write("You are Eligble to vote");//if sigle statement curly braces are not required
        //     }
        //     else
        //     {
        //         Console.Write("You are Not elgible to vote");
        //     }

        //if else if else ladder
        // if (age < 3) Console.Write("Infant");
        // else if (age < 13) Console.Write("Chaild");
        // else if (age < 20) Console.Write("Teenager");
        // else if (age < 60) Console.Write("Adult");
        // else Console.Write("Senior Citizen");

        //take day as input from the user 
        // byte dayno;
        // byte.TryParse(Console.ReadLine(),out dayno);

        // switch (dayno)
        // {
        //     case 1:
        //         Console.Write("Sunday");
        //         break;
        //     case 2:
        //         Console.Write("Monday");
        //         break;
        //     case 3:
        //         Console.Write("Tuesday");
        //         break;
        //     case 4:
        //         Console.Write("Wednesday");
        //         break;
        //     case 5:
        //         Console.Write("Thursday");
        //         break;
        //     case 6:
        //         Console.Write("Friday");
        //         break;
        //     case 7:
        //         Console.Write("Saturday");
        //         break;
        //     default:
        //         Console.Write("Wrong date");
        //         break;
        // }

        //get str from user count the number of the vowels 
        // Console.WriteLine("Enter the String");
        // string? word = Console.ReadLine();
        // int count = 0;
        // word=word?.ToLower();
        // for (int i = 0; i < word?.Length; i++)
        // {
        //     // if (word[i] == 'a' || word[i] == 'e' || word[i] == 'i' || word[i] == 'o' || word[i] == 'u')
        //     // {
        //     //     count++;
        //     // }
        //     switch (word[i])
        //     {
        //         case 'a':
        //         case 'e':
        //         case 'i':
        //         case 'o':
        //         case 'u': count++; break;
        //         default:
        //             break;
        //     }
        // }
        // Console.WriteLine("The number of vowels in the string {0} are  {1}", word, count);


        //Logical Operators *atserisk
        //And && apercent
        /* C1   C2   R
        ---------------
            T   T    T
            T   F    F
            F   T    F
            F   F    F

        //or  || 
        C1   C2   R
        ---------------
            T   T    T
            T   F    T
            F   T    T
            F   F    F
        //xor ^ carat
        C1   C2   R
        ---------------
            T   T    F
            T   F    T
            F   T    T
            F   F    F
        //not ! //~ tillder 


        */
    }
}
