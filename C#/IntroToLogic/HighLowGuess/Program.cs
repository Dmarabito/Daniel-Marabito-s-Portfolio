namespace HighLowGuessingGame
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int NumberOfGuesses = 0;
            Random Randy = new Random();
            int RandomNumber = (Randy.Next()%10)+1;
            string Guess = "";
            while(Guess != Convert.ToString(RandomNumber))
            {
                Console.WriteLine("What is you Guess"); Guess = Console.ReadLine();
                if (Convert.ToInt64(Guess) < RandomNumber) 
                {
                    NumberOfGuesses += 1;
                    Console.WriteLine("You are low");
                }
                else if(Convert.ToInt64(Guess) > RandomNumber)
                {
                    NumberOfGuesses += 1;
                    Console.WriteLine("You are high");
                }
                else if(Convert.ToInt64(Guess) == RandomNumber)
                {
                    NumberOfGuesses += 1;
                    Console.WriteLine("You got it right in "+Convert.ToString(NumberOfGuesses)+" tries");
                }
            }
        }
    }
}