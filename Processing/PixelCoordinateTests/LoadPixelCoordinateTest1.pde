boolean spamFilter = false;

void setup(){
  size(100,100);
}

void draw(){
  stroke(#FF0000);
  point(0,1);
  loadPixels();
  if (spamFilter == false) {
    println (pixels[0]);
    println (pixels[10]);
    println (pixels[100]);
    //for (int i=0;i < pixels.length;i++)
    //{
    //  print(i);
    //  print("=");
    //  print(pixels[i]);
    //  println();
    //}
    
    spamFilter = true;
  }
}
