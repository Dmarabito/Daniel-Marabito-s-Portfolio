boolean SpamFilter = false;
color[] DefaultColor;
color Red;
color Black;

void setup(){
  size(100,100);
  loadPixels();
  DefaultColor = pixels;
  Red = color(255,0,0);
  Black = color(0,0,0);
}

void draw(){
  stroke(#FF0000);
  point(100,0);

  loadPixels();
  if (SpamFilter == false)
  {
    println(PixelIndex(new PVector(50,3)));
    
    println(PixelCoordinate(350));
    TestFormulaAcuracy();
    SpamFilter = true;
  }
  
}

PVector PixelCoordinate(int PixelIndex){
  float x = PixelIndex % width;
  float y = PixelIndex / width;
  return new PVector(x,y);
}

int PixelIndex(PVector ChosenCoordinate){
  int Index = int(ChosenCoordinate.x + ChosenCoordinate.y * width);
  return Index;
}

void TestFormulaAcuracy(){

  for (int targetY = 0; targetY < 100; targetY++)
  {
  
      for (int targetX = 0; targetX < 100; targetX++)
      {
        loadPixels();
        pixels = DefaultColor;
        for (int i = 0; i < pixels.length;i++)
        {
          pixels[i] = Black;
        }
        updatePixels();
        stroke(Red);
        point(targetX,targetY);
        loadPixels();
        println(red(pixels[PixelIndex(new PVector(0,0))])," ",blue(pixels[PixelIndex(new PVector(0,0))])," ",green(pixels[PixelIndex(new PVector(0,0))]));
        println(red(pixels[PixelIndex(new PVector(targetX,targetY))])," ",blue(pixels[PixelIndex(new PVector(targetX,targetY))])," ",green(pixels[PixelIndex(new PVector(targetX,targetY))]));
        println(PixelCoordinate(PixelIndex(new PVector(targetX,targetY))).x== targetX && PixelCoordinate(PixelIndex(new PVector(targetX,targetY))).y== targetY );
        //if(pixels[PixelIndex(new PVector(targetX,targetY))] == Red)
        //{
        //  print(true);
        //}
        //else
        //{
        //  print(false);
        //}
       }
    
  }
}
