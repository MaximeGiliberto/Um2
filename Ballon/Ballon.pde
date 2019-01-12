ArrayList<Artist_b> artists;

Table table;
Table tableHeader;

void setup() {
  size(900, 800);
//get image from "data" and put in in background after resized it  
  PImage myImage = loadImage("image.jpg");
  set(0, 0, myImage);
  image(myImage, 0, 0);
  myImage.resize(900, 800);
  image(myImage, 0, 0);
  
// change the artist from coordinate plot and use artist_b which uses data from csv file I created with excel 
  artists = new ArrayList<Artist_b>();
  table = loadTable("ballon.csv", "header");
  tableHeader = loadTable("ballon.csv");
  //frame.setResizable(true);
  println(table.getRowCount() + "total Rows in a table");

  //on stocke dans artists les artist de l'objet Artist
  for (TableRow row : table.rows()) {
    artists.add(new Artist_b(row));
      
  }
}
//MouseClicked I don't succeed to remove what is written once you clicke the 2nd time
int value = 0;
  void mouseClicked() {
  if (value == 0) {
    value = 1;
  } else {
    value = 0;
  }
}
void draw(){
  //background(255);
  int hMargin = 15; //marge à gauche
  int vMargin = 15; //marge dessus/dessous
  
  fill(254,178,76);
  rect(hMargin,vMargin,width - 2* hMargin,height/6 - 3*vMargin);
  
  textSize(20);
  textAlign(CENTER);
  fill(0);
  text("Guess who won!", width/2, 5.5*hMargin);
 
  textSize(30);
  textAlign(CENTER);
  fill(0);
  text("UEFA's Ballon d'Or", width/2, 3.5*hMargin);

  
 //This button aims to remove what is written ... but I did not manage it unfortunately
  fill(0);
  rect(0.65*width,0.8*height,(width-4*hMargin)/3 ,height/6  );
   textSize(30);
  //textAlign(CENTER);
  fill(255);
  text("KEYI", 0.75*width, 0.9*height); 
  
  
  for(int i=0; i<3; i++){ 
    fill(254,178,76);
    rect(hMargin+i*((width-4*hMargin)/3+hMargin),height/6,(width-4*hMargin)/3 ,height/6 );
    fill(0);
    textAlign(CENTER);
    text(tableHeader.getString(1,i),hMargin+i*((width-4*hMargin)/3+hMargin)+(width-4*hMargin)/6,height/4+0.5*vMargin);
  }
  
 
  
  
 // display information from the csv file 
  
  for (int i=0; i<3; i++){
    if ((mouseX>hMargin+i*((width-4*hMargin)/3+hMargin)) && (mouseX<hMargin+(i+1)*((width-4*hMargin)/3+hMargin)) &&       (mouseY>height/6) &&       (mouseY< 2*height/6) &&       mousePressed) {
        
        fill(255);
        textSize(50);
        textAlign(CENTER);
        text(tableHeader.getString(2,i), width/2, height/2);
        text(tableHeader.getString(3,i), width*1/4, height*3/4);
        text(tableHeader.getString(4,i), width*3/4, height*3/4);
        
    }

  }
}  
  
