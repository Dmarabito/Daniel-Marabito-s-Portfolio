namespace diceRolling1V2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string NumberOfDicePairsAsString;
            int currentValue;
            int NumberOfDicePairs = 0;
            int total = 0;
            int NumberOf2s = 0;
            int NumberOf3s = 0;
            int NumberOf4s = 0;
            int NumberOf5s = 0;
            int NumberOf6s = 0;
            int NumberOf7s = 0;
            int NumberOf8s = 0;
            int NumberOf9s = 0;
            int NumberOf10s = 0;
            int NumberOf11s = 0;
            int NumberOf12s = 0;

            Console.WriteLine("How many dice pairs would you like to roll?");
            NumberOfDicePairs = Convert.ToInt32(Console.ReadLine());
            for (int i = 0; i < NumberOfDicePairs; i++)
            {
                currentValue = Roll2d6();
                total += currentValue;
                if (currentValue == 2)
                { NumberOf2s += 1; }
                else if (currentValue == 3)
                { NumberOf3s += 1; }
                else if (currentValue == 4)
                { NumberOf4s += 1; }
                else if (currentValue == 5)
                {
                    NumberOf5s += 1;
                }
                else if (currentValue == 6)
                {
                    NumberOf6s += 1;
                }
                else if (currentValue == 7)
                {
                    NumberOf7s += 1;
                }
                else if (currentValue == 8)
                {
                    NumberOf8s += 1;
                }
                else if (currentValue == 9)
                {
                    NumberOf9s += 1;
                }
                else if (currentValue == 10)
                {
                    NumberOf10s += 1;
                }
                else if (currentValue == 11)
                {
                    NumberOf11s += 1;
                }
                else if (currentValue == 12)
                {
                    NumberOf12s += 1;
                }
            }
            Console.Write("Number of 2s "); Console.WriteLine(NumberOf2s);
            Console.Write("Number of 3s "); Console.WriteLine(NumberOf3s);
            Console.Write("Number of 4s "); Console.WriteLine(NumberOf4s);
            Console.Write("Number of 5s "); Console.WriteLine(NumberOf5s);
            Console.Write("Number of 6s "); Console.WriteLine(NumberOf6s);
            Console.Write("Number of 7s "); Console.WriteLine(NumberOf7s);
            Console.Write("Number of 8s "); Console.WriteLine(NumberOf8s);
            Console.Write("Number of 9s "); Console.WriteLine(NumberOf9s);
            Console.Write("Number of 10s "); Console.WriteLine(NumberOf10s);
            Console.Write("Number of 11s "); Console.WriteLine(NumberOf11s);
            Console.Write("Number of 12s "); Console.WriteLine(NumberOf12s);
            Console.Write("The total was ");Console.WriteLine(total);
            Console.Write("The average is "); Console.WriteLine(Convert.ToDouble(total) / Convert.ToDouble(NumberOfDicePairs));
        }
        static int Roll2d6()
        {
            int DieTotal = 0;
            int DieResult = 0;
            Random randy = new Random();
            for (int i = 0; i < 2; i++)
            {
                DieResult= (randy.Next() % 6)+1;
                DieTotal += DieResult;
            }
            return DieTotal;
        }
    }
}