namespace Lab2MadLib
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Give me a noun");
            string noun1 = Console.ReadLine();
            Console.WriteLine("Give me a second noun");
            string noun2 = Console.ReadLine();
            Console.WriteLine("Give me a third noun");
            string noun3 = Console.ReadLine();
            Console.WriteLine("Give me a fourth noun");
            string noun4 = Console.ReadLine();
            Console.WriteLine("Give me a fifth noun");
            string noun5 = Console.ReadLine();
            Console.WriteLine("Give me a verb");
            string verb1 = Console.ReadLine();
            Console.WriteLine(noun1+" "+verb1+" "+noun2+". while "+noun3+" "+verb1+" "+noun4+"."+"It was horrible "+noun5+" was watching it all."+"\nLater "+noun1+" attempted to explain their behavior to "+noun5+".\nAfter a through explanation "+noun5+" decided to join in on the fun, so "+ noun5+" "+verb1+" "+noun4+". \nThe news paper headline the next day read, "+noun5+" "+verb1+" "+noun4+". under "+noun1+"'s supervision.");
        }
    }
}