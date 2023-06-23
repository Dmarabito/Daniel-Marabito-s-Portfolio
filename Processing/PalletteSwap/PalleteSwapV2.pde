String Status = "Setup";
Boolean ShowStatus = true;
 PImage MainImage;
 PImage PalletImage;
 String MainImagePath;
 String PalletImagePath;
 boolean MainFileFound = false;
 boolean PalletFileFound = false;
 color[] ReducedPallet = new color[0];
 color[] MainImagePixels = new color[0];
 color[] ReducedMainImage = new color[0];
 color[] equivalents = new color[0];

void setup()
{
  fullScreen();
  //TestThread TestyTheThread = new TestThread();
  //TestyTheThread.start();
  PrimaryImageProcessingThread PrimeIPThread = new PrimaryImageProcessingThread();
  PrimeIPThread.start();
  

}

void draw()
{
  if (ShowStatus == true)
  {
    DisplayText(Status);
  }
  else
  {
    image(MainImage,0,0);
  }
}

void DisplayText(String InText)
{
  textSize(100);
  fill(color(0,0,0));
  rect(0,0,width,height);
  fill(color(255,255,255));
  text(InText,(float(width/2)-(textWidth(InText))/2),float(height/2));
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
    Status = "Reducing image " + str(i)+" of " + str(InputImage.pixels.length);
    //println(str(i)+" of " + str(InputImage.pixels.length));
    //DisplayText(str(i)+" of " + str(InputImage.pixels.length));

  }
  return OutputPallet;
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


// Classes
//class TestThread extends Thread
//{
//  public void run()
//  {
//    int i = 0;
//    while(true)
//    {
//      i++;
//      Status = str(i);
//    }
//  }
//}

class PrimaryImageProcessingThread extends Thread
{
  
  public void run() //This is where run starts, so if you get lost look here. <<<<<<<<<<<<<<<<<<<<<<<<<<<<
  {
    Status = "Starting Image Processing Thread";
      // Get Main image path from file
      selectInput("Select the main image : ", "MainImageSelection");
      
     // Prevent the main line from continuing before the file select thread is done.
     while (MainFileFound == false)
  {
    Status = "Selecting Main Image";
  }
     // Load Main image
     MainImage = loadImage(MainImagePath);
     
    // Get pallete image Path
     selectInput("Select the Pallet image : ", "PalletImageSelection");
  
  // stall mainline for file select thread to catch up.
       while (PalletFileFound  == false)
  {
        Status = "Selecting Pallet Image";
  }
  
  PalletImage = loadImage(PalletImagePath);
  
  // Reduce Pallet Image pixels to a color pallete
  for (int i = 0; i < PalletImage.pixels.length; i++)
  {
        //if (ReducdPallet.has, does not exist boo hoo, so I made my own.
    if (HasColor(ReducedPallet,PalletImage.pixels[i]) == false)
    {
      //ArrayList was being wack so I made my own append to be able to use an array.
      ReducedPallet = AppendColorArray(ReducedPallet,PalletImage.pixels[i]);
      Status = "Reducing Color Pallet, "+ str(i)+" of "+ str(PalletImage.pixels.length);
      //text(str(PalletImage.pixels.length), 100, 200);
      //DisplayText(str(PalletImage.pixels.length));
    }
    
    Status = "Color Pallet Reduced";

  }
  // get pixels of main image
  Status = "Getting Main Image Pixels";
  MainImage.loadPixels();
  MainImagePixels = MainImage.pixels;
  
  //Reduce Main image to a pallete
  ReducedMainImage = ReducedImagePallet(MainImage);
  Status = "Main Image reduced to a Pallete";
 
 
 
 // for each pixel of reduced main image compare to color pallete. Make an equivalent.
  Status = "Making a Pallete of equivalent colors";
  for (int i = 0; i < ReducedMainImage.length; i++)
  {
   equivalents = AppendColorArray(equivalents,NearestColor(ReducedMainImage[i],ReducedPallet));
   Status = "Find equivalent colors "+str(i)+" Of "+ReducedMainImage.length;
  }
  Status = "Finished finding equivalents";
  
 // Replace each pixel with nearest in terms of color.
    for (int i = 0; i < MainImagePixels.length; i++)
    {
      MainImagePixels[i] = equivalents[GetIndexFromColor(ReducedMainImage,MainImagePixels[i])];
      Status = "Replacing Colors "+str(i)+" of "+str(MainImagePixels.length);
    }
    
   MainImage.pixels = MainImagePixels;
   MainImage.updatePixels();
   Status = "All colors Replaced";
   MainImage.resize(displayWidth,displayHeight);
   ShowStatus = false;
  selectOutput("Where would you like to save it?", "SaveImage");


  }





//void MainImageSelection (File SelectedImage)
//{
//  println("Main Image Selected");
//    if (SelectedImage == null)
//    {
//      selectInput("Select the main image : ", "MainImageSelection");
//    }
//    else
//    {
//      MainFileFound = true;
//      MainImagePath = SelectedImage.getAbsolutePath();
//    }
//}






}
