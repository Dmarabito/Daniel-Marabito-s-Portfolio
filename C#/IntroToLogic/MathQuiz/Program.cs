namespace MathquizProgram
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int NumberOfCorrectAnswers = 0;
            string TextInput = "";
            Console.Write("1+1= ");TextInput = Console.ReadLine();
            if ((1 + 1) == Convert.ToInt32(TextInput))
            {
                NumberOfCorrectAnswers += 1;
                Console.WriteLine("correct");
            }
            else
            {
                Console.WriteLine("Incorrect");
            }

            Console.Write("2+1= "); TextInput = Console.ReadLine();
            if ((2 + 1) == Convert.ToInt32(TextInput))
            {
                NumberOfCorrectAnswers += 1;
                Console.WriteLine("correct");
            }
            else
            {
                Console.WriteLine("Incorrect");
            }

            Console.Write("2+3= "); TextInput = Console.ReadLine();
            if ((2 + 3) == Convert.ToInt32(TextInput))
            {
                NumberOfCorrectAnswers += 1;
                Console.WriteLine("correct");
            }
            else
            {
                Console.WriteLine("Incorrect");
            }

            Console.Write("10*9= "); TextInput = Console.ReadLine();
            if ((10*9) == Convert.ToInt32(TextInput))
            {
                NumberOfCorrectAnswers += 1;
                Console.WriteLine("correct");
            }
            else
            {
                Console.WriteLine("Incorrect");
            }

            Console.Write("22*4= "); TextInput = Console.ReadLine();
            if ((22*4) == Convert.ToInt32(TextInput))
            {
                NumberOfCorrectAnswers += 1;
                Console.WriteLine("correct");
            }
            else
            {
                Console.WriteLine("Incorrect");
            }
            Console.WriteLine("You got " + Convert.ToString(NumberOfCorrectAnswers)+" Correct");
        }
    }
}