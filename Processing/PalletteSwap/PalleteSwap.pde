 PImage MainImage;
 PImage PalletImage;
color[] PalletImagePixels = new color[0];
color[] ReducedPallet = new color[0];
color[] MainImagePixels = new color[0];
color[] ReducedMainImage = new color[0];
color[] equivalents = new color[0];
boolean MainFileFound = false;
String MainImagePath;
boolean PalletFileFound = false;
String PalletImagePath;
boolean SetupComplete = false;


void setup()
{
  print("codeStart");
  textSize(100);
  // Get Main image path from file
    selectInput("Select the main image : ", "MainImageSelection");
 
    // Prevent the main line from continuing before the file select thread is done.
     while (MainFileFound == false)
  {
    print("Jaming");
  }
  
  // Load Main image
  MainImage = loadImage(MainImagePath);
  
 
  // Get pallete image Path
  selectInput("Select the main image : ", "PalletImageSelection");
  
  // stall mainline for file select thread to catch up.
       while (PalletFileFound  == false)
  {
    print("Jaming");
  }
  // Load Pallet image
  PalletImage = loadImage(PalletImagePath);
  
  // Get pixels of pallete image
  PalletImage.loadPixels();
  PalletImagePixels = PalletImage.pixels;
  

// Reduce Pallet Image pixels to a color pallete
  for (int i = 0; i < PalletImage.pixels.length; i++)
  {
        //if (ReducdPallet.has, does not exist boo hoo, so I made my own.
    if (HasColor(ReducedPallet,PalletImage.pixels[i]) == false)
    {
      //ArrayList was being wack so I made my own append to be able to use an array.
      ReducedPallet = AppendColorArray(ReducedPallet,PalletImage.pixels[i]);
      println (PalletImage.pixels.length);
      //text(str(PalletImage.pixels.length), 100, 200);
      //DisplayText(str(PalletImage.pixels.length)); //<>//
    }

  }
  
  
  
// get pixels of main image
  MainImage.loadPixels();
  MainImagePixels = MainImage.pixels;

  //Reduce Main image to a pallete
  ReducedMainImage = ReducedImagePallet(MainImage);

// for each pixel of reduced main image compare to color pallete. Make an equivalent.
  for (int i = 0; i < ReducedMainImage.length; i++)
  {
   equivalents = AppendColorArray(equivalents,NearestColor(ReducedMainImage[i],ReducedPallet));
  }

    // Replace each pixel with nearest in terms of color.
    for (int i = 0; i < MainImagePixels.length; i++)
    {
      MainImagePixels[i] = equivalents[GetIndexFromColor(ReducedMainImage,MainImagePixels[i])];
      println("Color replacement progress "+str(i)+"/"+str(MainImagePixels.length));
    }
    
   MainImage.pixels = MainImagePixels;
   MainImage.updatePixels();
  // format for display
  fullScreen();
  MainImage.resize(displayWidth,displayHeight);
  selectOutput("Where would you like to save it?", "SaveImage");
  SetupComplete = true;
}

void draw()
{
  if (SetupComplete == true)
  {
    image(MainImage,0,0);
  }
  
}

boolean HasColor(color[] InputArray,color checkColor)
{
  for (int i = 0; i< InputArray.length; i++)
  {
   if (InputArray[i] == checkColor)
   {
     return true;
   }
  }
  return false;
}

color[] AppendColorArray(color[] InputArray, color ColorToAppend)
{
  color[] OutputArray = new color[(InputArray.length+1)];
  
  for (int i = 0; i<InputArray.length; i++)
  {
    OutputArray[i] = InputArray[i];
  }
  OutputArray[OutputArray.length - 1] = ColorToAppend;
  return OutputArray;
}

color NearestColor(color OGColor, color[] PalletColors)
{
  float DistanceToColor = abs(qred(OGColor)-qred(PalletColors[0])) + abs(qgreen(OGColor)-qgreen(PalletColors[0])) + abs(blue(OGColor)-blue(PalletColors[0])) ;
  color CurrentColorPossibility = PalletColors[0];
  
  for (int i = 0; i < PalletColors.length; i++)
  {
    if ((abs(qred(OGColor)-qred(PalletColors[i])) + abs(qgreen(OGColor)-qgreen(PalletColors[i])) + abs(blue(OGColor)-blue(PalletColors[i]))) < DistanceToColor)
    {
      CurrentColorPossibility = PalletColors[i];
      DistanceToColor = (abs(qred(OGColor)-qred(PalletColors[i])) + abs(qgreen(OGColor)-qgreen(PalletColors[i])) + abs(blue(OGColor)-blue(PalletColors[i])));
    }
  }
  return CurrentColorPossibility;
  
}

//Used what was advised to get color values faster, as I was having speed problems.
float qred(color ExampleColor)
{
  return (ExampleColor >> 16 & 0xFF);
}

float qgreen(color ExampleColor)
{
  return (ExampleColor >> 8 & 0xFF);
}

color[] ReducedImagePallet(PImage InputImage)
{
    InputImage.loadPixels();      
    color[] OutputPallet = new color[0];
    for (int i = 0; i < InputImage.pixels.length; i++)
  {
    if (HasColor(OutputPallet,InputImage.pixels[i]) == false)
    {
      OutputPallet = AppendColorArray(OutputPallet,InputImage.pixels[i]);
    }
    println(str(i)+" of " + str(InputImage.pixels.length));
    //DisplayText(str(i)+" of " + str(InputImage.pixels.length));

  }
  return OutputPallet;
}

int GetIndexFromColor(color[] Inarray, color InColor)
{
  for (int i = 0; i < Inarray.length; i++)
  {
    if (Inarray[i] == InColor)
    {
      return i;
    }
  }
  return 0;
}

void MainImageSelection (File SelectedImage)
{
  println("Main Image Selected");
    if (SelectedImage == null)
    {
      selectInput("Select the main image : ", "MainImageSelection");
    }
    else
    {
      MainFileFound = true;
      MainImagePath = SelectedImage.getAbsolutePath();
    }
}

void PalletImageSelection(File SelectedImage)
{
  println("Pallete Image Selected");
    if (SelectedImage == null)
    {
      selectInput("Select the Pallet image : ", "PalletImageSelection");
    }
    else
    {
      PalletFileFound = true;
      PalletImagePath = SelectedImage.getAbsolutePath();
    }
}

void SaveImage(File ImageToBeSaved)
{
  if(ImageToBeSaved == null)
  {
    selectOutput("Where would you like to save it?", "SaveImage");
  }
  else
  {
    String Path = ImageToBeSaved.getAbsolutePath();
    if (match(Path,"(.JPG)|(.jpg)|(.jpeg)|(.JPEG)|(.tiff)|(.tif)|(.TIF)|(.TIFF)|(.png)|(.PNG)") == null)
    {
      Path = Path + ".png";
    }
    save(Path);
  }
  //Keyboard was being annoying again so had to copy and paste () 
  //()
}

// I was going to have it Display text showing the progress so you are not just looking at a grey screen.
//However it seemed like everything being in the setup was creating issues for drawing text so I ended up scraping this.
void DisplayText(String InText)
{
  textSize(100);
  fill(color(0,0,0));
  rect(0,0,width,height);
  fill(color(255,255,255));
  text(InText,float(width/2),float(height/2));
  //draw();
}
