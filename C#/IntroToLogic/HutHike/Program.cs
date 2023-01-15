namespace HutHike
{
    internal class Program
    {
        static void Main(string[] args)
        {
            for (int i = 0; i <= 100; i++) 
            {
                if (i % 3 == 0 && i % 7 == 0)
                {
                    Console.WriteLine("hutt and hike");
                }
                else if (i % 3 == 0)
                {
                    Console.WriteLine("hutt");
                }
                else if (i % 7 == 0)
                {
                    Console.WriteLine("hike");
                }
                else 
                {
                    Console.WriteLine(i);
                }
            }
        }
    }
}