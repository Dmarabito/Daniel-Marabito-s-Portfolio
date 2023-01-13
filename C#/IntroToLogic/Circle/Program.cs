namespace Circle
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("What would you like this circle's radius to be?"); double radius = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("The area of the circle is "+ Convert.ToString(Math.PI* Math.Pow(radius, 2)));
            Console.WriteLine("The Circumference is " + Convert.ToString(2 * Math.PI * radius));
        }
    }
}