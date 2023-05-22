import java.io.File;

PImage Rimage;

void setup(){
  String ImageDir = "C:/image";
  
  File Imgdirectory = new File(ImageDir);
  File[] ListOfImages = Imgdirectory.listFiles();
  int NumberOfChosenImage = (int) random(ListOfImages.length);

//Checks if the selected is an image file based on extention.
  while((ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".jpg")  == false)
  &&(ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".png")  == false)
  &&(ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".gif")  == false)
  &&(ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".JPG")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".tiff")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".bmp")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".BMP")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".GIF")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".WBMP")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".PNG")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".JPEG")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".tif")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".TIF")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".TIFF")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".jpeg")  == false)
  && (ListOfImages[NumberOfChosenImage].getAbsolutePath().endsWith(".wbmp")  == false))
//The above is just a conditonal that runs a while if it isn't an image format.
  {
    print(ListOfImages[NumberOfChosenImage].getAbsolutePath());
    print("<<< thats not an image");
    NumberOfChosenImage = (int) random(ListOfImages.length);
  }
  // tiff, bmp, BMP, GIF, WBMP,PNG, JPEG, tif, TIF, TIFF, jpeg, wbmp)
  Rimage = loadImage(ListOfImages[NumberOfChosenImage].getAbsolutePath());
  Rimage.resize(displayWidth, displayHeight);
  fullScreen();

}

void draw()
{

  image(Rimage, 0, 0);
}

//();
