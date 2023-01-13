namespace AdditionCalculator
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Give me a number");
            double Value1 = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Give me another");
            double Value2 = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine(Value1+Value2);
        }
    }
}