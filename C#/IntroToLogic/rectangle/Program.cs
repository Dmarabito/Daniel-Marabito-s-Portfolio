namespace Rectangle
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("What is the width of the rectangle?"); double width =Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("What is the length of the rectangle?"); double Length=Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("The perimeter is "+Convert.ToString(2*width+2*Length));
            Console.WriteLine("The area is " + Convert.ToString(width * Length));
        }
    }
}