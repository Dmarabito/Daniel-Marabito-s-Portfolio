// See https://aka.ms/new-console-template for more information
/*Your name
What programming experience you have
What you became interested in computers and programming
Your class expectations
Professional goals / Your goals after Tri-C
One or two 'Big Dream Goals.'*/
using System.Numerics;

Console.WriteLine("Your name: Daniel Marabito");
Console.WriteLine("\nWhat programming experience you have:\nI have been programing for years.\nI got into game design as a child and have done some programing ever since.\nMy current main language is gdscript which is used in godot.\nI have dabbled in C++, java,bat,python,perl,unity, and more.\nIn highschool I did some robot programing using a rasbery pi for the national robotics competition.\nI got to the semi-finals.");
Console.WriteLine("\nWhat you became interested in computers and programming:\nI have been intered in gaming, game design,3d printing, modeling,\nhacking, reverse engineering, artificial intellegence, and robotics.");
Console.WriteLine("\nYour class expectations, I hope I have an enjoyable time :)");
Console.WriteLine("\nProfessional goals / Your goals after Tri-C\nOne of my goals has been to start up a game design studio.\nI do have an itch.io for publishing games but thus far I have seen limited success.\nOn a realted note here is my current game design project:\nhttps://toizeito.itch.io/knightform");
Console.WriteLine("\nOne or two 'Big Dream Goals\nDesigning a companion AI.\nMaking a game that is beloved by many people.\n");
//This is where I fool around for a bit.

List <string> OptionList = new List<string>();
OptionList.Add(".obj Creator");
OptionList.Add("random color");
OptionList.Add("Return to Darkness");
OptionList.Add("exit");

string SelectedOption = "";
string TempxCoord = "";
string TempyCoord = "";
string TempzCoord = "";
string CurrentFaceDefinition = "f";
List<string> CoordinateList = new List<string>();
List<string> FaceList = new List<string>();
List<string> CoordinateAndFaceList = new List<string>();
Random Randy = new Random();
int ColorNumber = 0;
while (SelectedOption != "exit")
{ 
Console.WriteLine("This is where I play around a bit, type in the option you want to see");
foreach (string Instring in OptionList)
{ Console.WriteLine(Instring);}
SelectedOption = Console.ReadLine();
if (SelectedOption == ".obj Creator")
{
    Console.WriteLine("So you want to make a .obj file?\nHere is how this works, we will make points and then connect them into faces.\nAre you ready to start?\n(yes or otherwise)");
    if(Console.ReadLine() == ("yes"))
        {
            SelectedOption = "";
            while ((SelectedOption != "done")&& (SelectedOption != "d"))
            {
                Console.WriteLine("Coordinates Thus Far");
                foreach (string Instring in CoordinateList)
                { Console.WriteLine(Instring); }
                Console.WriteLine("Type done if you are done, otherwise enter the x-coordinate");
                SelectedOption = Console.ReadLine();
                if(SelectedOption == "done"||SelectedOption == "d")
                { break; }
                TempxCoord = SelectedOption;
                Console.WriteLine("Now enter the y-coordinate");
                SelectedOption = Console.ReadLine();
                TempyCoord = SelectedOption;
                Console.WriteLine("Now enter the z-coordinate");
                SelectedOption = Console.ReadLine();
                TempzCoord = SelectedOption;
                Console.WriteLine("Are you satisfied with point "+TempxCoord+" "+TempyCoord+" "+TempzCoord+"?\nyes or otherwise");
                SelectedOption= Console.ReadLine();
                if(SelectedOption == "yes")
                {
                    CoordinateList.Add("v "+TempxCoord+" "+TempyCoord+" "+TempzCoord);
                }
            }
            SelectedOption = "";
            while (SelectedOption != "done")
            {
                for (int i = 0; i<CoordinateList.Count;i++)
                {
                    Console.WriteLine((i+1).ToString() + ". " + CoordinateList[i]);
                }
                Console.WriteLine("Type the number of the vertex you want to add to this face.\nSo if you want to add the 1st vertext type 1.\nYou can add multiple vertexes to a face at once by seperating subsequent numbers with a space.");
                Console.WriteLine("Type 'face complete' when this face is complete, or 'done' when finished");
                Console.WriteLine("You can type clear if you are unsatisfied with the current face.");
                Console.WriteLine("The Following Faces have been completed");
                foreach (string Instring in FaceList)
                { Console.WriteLine(Instring); }
                Console.WriteLine("Current face is " + CurrentFaceDefinition);
                SelectedOption = Console.ReadLine();
                if (SelectedOption == "done" || SelectedOption == "d")
                { break; }
                else if (SelectedOption == "face complete")
                {
                    FaceList.Add(CurrentFaceDefinition);
                    CurrentFaceDefinition = "f";
                }
                else if (SelectedOption == "clear")
                {
                    CurrentFaceDefinition = "f";
                }
                else
                {
                    CurrentFaceDefinition = CurrentFaceDefinition + " " + SelectedOption;
                }
             }
            CoordinateAndFaceList.AddRange(CoordinateList);
            CoordinateAndFaceList.AddRange(FaceList);
            Console.WriteLine("please write path including the .obj extention.");
            saveFile(Console.ReadLine(),CoordinateAndFaceList);


        }
}
else if (SelectedOption == "random color")
    {
        ColorNumber = Randy.Next(15);
        if (ColorNumber == 0)
        {
            Console.BackgroundColor = ConsoleColor.Black;
            Console.Clear();
        }
        else if(ColorNumber == 1)
        {
            Console.BackgroundColor = ConsoleColor.Yellow;
            Console.Clear();
        }
        else if (ColorNumber == 2)
        {
            Console.BackgroundColor = ConsoleColor.Magenta;
            Console.Clear();
        }
        else if (ColorNumber == 3)
        {
            Console.BackgroundColor = ConsoleColor.DarkGreen;
            Console.Clear();
        }
        else if (ColorNumber == 4)
        {
            Console.BackgroundColor = ConsoleColor.DarkBlue;
            Console.Clear();
        }
        else if (ColorNumber == 5)
        {
            Console.BackgroundColor = ConsoleColor.Green;
            Console.Clear();
        }
        else if (ColorNumber == 6)
        {
            Console.BackgroundColor = ConsoleColor.Blue;
            Console.Clear();
        }
        else if (ColorNumber == 7)
        {
            Console.BackgroundColor = ConsoleColor.Cyan;
            Console.Clear();
        }
        else if (ColorNumber == 8)
        {
            Console.BackgroundColor = ConsoleColor.DarkCyan;
            Console.Clear();
        }
        else if (ColorNumber == 9)
        {
            Console.BackgroundColor = ConsoleColor.DarkMagenta;
            Console.Clear();
        }
        else if (ColorNumber == 10)
        {
            Console.BackgroundColor = ConsoleColor.DarkRed;
            Console.Clear();
        }
        else if (ColorNumber == 11)
        {
            Console.BackgroundColor = ConsoleColor.DarkYellow;
            Console.Clear();
        }
        else if (ColorNumber == 12)
        {
            Console.BackgroundColor = ConsoleColor.DarkGray;
            Console.Clear();
        }
        else if (ColorNumber == 13)
        {
            Console.BackgroundColor = ConsoleColor.Gray;
            Console.Clear();
        }
        else if (ColorNumber == 14)
        {
            Console.BackgroundColor = ConsoleColor.Red;
            Console.Clear();
        }
        Console.WriteLine("Color Generated");
    }
else if (SelectedOption == "Return to Darkness")
    {
        Console.BackgroundColor = ConsoleColor.Black;
        Console.Clear();
    }
}

static void saveFile(string Path,List<string>SaveData)
{
    File.WriteAllLines(Path, SaveData);
    Console.WriteLine(Path + "was saved");
}