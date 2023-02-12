namespace BonusPrimeNumber
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string Input1 = "";
            string Input2 = "";
            int Number1;
            int Number2;
            int LowNumber;
            int HighNumber;
            bool PrimeNum1 = true;
            NumberInputSection:
            while (int.TryParse(Input1,out Number1) == false)
            {
                Console.Write("Enter 1st input: "); Input1 = Console.ReadLine();
            }
            while (int.TryParse(Input2, out Number2) == false)
            {
                Console.Write("Enter the 2nd input: "); Input2 = Console.ReadLine();
            }
            if (Number1 > Number2)
            {
                HighNumber = Number1;
                LowNumber = Number2;
            }
            else if(Number1 < Number2) 
                {
                    LowNumber = Number1;
                    HighNumber = Number2;
                }
            else
                {
                Console.WriteLine("Number pair is invalid");
                Input1 = "";
                Input2 = "";
                goto NumberInputSection;
                }
            for (int i = LowNumber+1; i < HighNumber; i++) 
            {
                if (IsPrime(i) == true)
                {
                    if(PrimeNum1 == false)
                    {
                        Console.Write(", ");
                    }
                    else
                    {
                        PrimeNum1 = false;
                    }
                    Console.Write(i);

                    
                }
            }
            //Console.WriteLine(IsPrime(2147483646));
        }

        static bool IsPrime(int CheckNumber)
        {
            for (int i = 2; i < CheckNumber; i++)
            {
                if(CheckNumber%i == 0)
                {
                    return false;
                }
            }
            return true;
        }
    }
}