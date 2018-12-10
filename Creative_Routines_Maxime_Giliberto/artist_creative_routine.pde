//DOCMAX
//map library
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;

Artists artists;

Table table;

void setup() {
  //background color and window size
  background(173,221,142);
  size(1700, 800);
  //Use of the mouse to resize
  surface.setResizable(true);
  //artists = new ArrayList<Artist>();
  //table = loadTable("creative-routines.csv", "header");
  artists= new Artists("creative-routines-enhanced.csv");
 
}

  void draw(){
  //Var i need w for weight and h for height (all may change)
  float hHeadline=height*5/100;
  float hTitle=height*10/100;
  float hName=height*70/100;
  float hActivity=height*10/100;
  float wMargin =width/100;
  float hMargin =height/100;
  float wName=width*30/100;
  float hLine=hName;
  float wLine=width*67/100;
  float hMName=hName*1/100;
  fill(227, 74, 51);

  
  float vizWidth = width-2*wMargin;
  //float vizHeight = width-2*hMargin;//not used for me

  /*//list of colors hexa from i want hue
  List colorous=new LinkedList();
  colorous.add(#9d6231);
  colorous.add(#a258c6);
  colorous.add(#65b745);
  colorous.add(#d44a9b);
  colorous.add(#4ba778);
  colorous.add(#d2425b);
  colorous.add(#4bafd0);
  colorous.add(#6472c7);
  colorous.add(#c4ab3f);
  colorous.add(#cb8ece);
  colorous.add(#98b05f);
  colorous.add(#a95375);
  colorous.add(#6b742b);
  colorous.add(#e08e74);
  colorous.add(#db862e);*/
  
  
///headlines
  fill(254, 232, 200);
  rect(wMargin, hMargin, vizWidth, hHeadline);
  fill(227, 74, 51);
  textAlign(CENTER,CENTER);
  textSize(0.7*hHeadline);
  text("ARTIST CREATIVE ROUTINES", vizWidth/2, hMargin+(hHeadline/2));
//Title
  fill(227, 74, 51);//(173,221,142);
  rect(wMargin, 2*hMargin+hHeadline, vizWidth, hTitle);
  fill(247, 252, 185);
  textAlign(CENTER,CENTER);
  textSize(0.7*hTitle);
  text("What kind of Artist are YOU ?", vizWidth/2, hMargin*2+hHeadline+hTitle/2);
//Names
  fill(0);
  rect(wMargin, 3*hMargin+hHeadline+hTitle , wName, hName);
  
  //just to know who and how many artists? 
  /*int i=0;
  for(Artist artist:artists.alist){
    //int i=0;
    println(artist.name);
    i=i+1;
    println(i);
  }*/
//Line
  fill(0);
  rect(2*wMargin+wName, 3*hMargin+hHeadline+hTitle, wLine, hLine);
//Activities
  fill(0);
  rect(2*wMargin+wName,4*hMargin+hHeadline+hTitle+hLine , wLine, hActivity);
//Picture
  
//NAMES
  //Table of colors from i want hue 
  int [][] colorous ={{185,97,113},{128,181,58},{191,81,183},{89,189,113},{117,98,202},{209,161,49},{97,137,202},{208,68,64},{76,187,176},{211,70,128},{70,128,69},{195,130,194},{118,117,40},{227,130,78},{186,171,100},{157,92,43}};
  int col=0;
  float j=2*hMName;
  float jj=0;
  float scale=13.5;
  for(Artist artist:artists.alist){
    float Z=wLine/7;
    
    fill (colorous[col][0],colorous[col][1],colorous[col][2]);
    
    stroke(colorous[col][0],colorous[col][1],colorous[col][2]);
    col=col+1;
    
    textSize(0.9*(hName-(16-1)*hMName)/16);
    textAlign(CENTER,CENTER);
    text(artist.name, wMargin+wName/2, 3*hMargin+hHeadline+hTitle+j);
    //first line between the name and the 1st activity
    //map(valeur,debut,fin,nouveaudebut,nouvellefin)
    line(2*wMargin+wName, 3*hMargin+hHeadline+hTitle+j, 2*wMargin+wName+Z, 3*hMargin+hHeadline+hTitle+hName-map(artist.getActivity(artists.variances.keyArray()[0]),0,13.5,0,hName) );
    
    //scale
    stroke(255);
    fill(255);
    line(2*wMargin+wName+0.99*wLine,3*hMargin+hHeadline+hTitle , 2*wMargin+wName+0.99*wLine, 3*hMargin+hHeadline+hTitle+hLine);
    textSize(0.5*(hName-(16-1)*hMName)/16);
    textAlign(RIGHT,BOTTOM);
    text(scale,2*wMargin+wName+0.99*wLine,3*hMargin+hHeadline+hTitle+j);
    scale=scale-13.5/16;
    jj=jj+j;
    j=j+hMName+(hName-(16-1)*hMName)/16;
  }
    
  //Vertical Lines and name of activities
  float k=wLine/7;
  for(String activity:artists.variances.keyArray()){
    stroke(255);
    line(2*wMargin+wName+k, 3*hMargin+hHeadline+hTitle, 2*wMargin+wName+k, 3*hMargin+hHeadline+hTitle+hName);
    fill(247, 252, 185);
    textSize(0.25*hActivity);
    textAlign(CENTER,CENTER);
    text(activity, 2*wMargin+wName+k, 4*hMargin+hHeadline+hTitle+hName+0.5*hActivity);
    k=k+wLine/7;
  }

  
  //Tracer les lignes
  
  float LineBeginX;
  float LineBeginY;
  float LineEndY;
 
  
  //for each activity of each artist
  
  int colo=0;
  for(Artist artist:artists.alist){
    
    float Z=wLine/7;
    int [][] colorouss ={{185,97,113},{128,181,58},{191,81,183},{89,189,113},{117,98,202},{209,161,49},{97,137,202},{208,68,64},{76,187,176},{211,70,128},{70,128,69},{195,130,194},{118,117,40},{227,130,78},{186,171,100},{157,92,43}};
    
    stroke (colorouss[colo][0],colorouss[colo][1],colorouss[colo][2]);
    colo=colo+1;

    for(int i=0; i<artists.variances.size()-1; i++){//table artist.variances is sorted with variances; Key is the activity and Value is nb hours
      String currentAct=artists.variances.keyArray()[i];
      String futureAct=artists.variances.keyArray()[i+1];
      float currentActValue= artist.getActivity(currentAct);
      float futureActValue= artist.getActivity(futureAct);

      
      //float max  = artists.maxs.get(currentAct);//the max of all activities&the max of each one
      
      LineBeginX=2*wMargin+wName+(i+1)*Z;
      LineBeginY=3*hMargin+hHeadline+hTitle+hName-map(currentActValue,0,13.5,0,hName);//13.5 is tha max of maxs
      LineEndY=3*hMargin+hHeadline+hTitle+hName-map(futureActValue,0,13.5,0,hName);
      
      
      line(LineBeginX, LineBeginY, LineBeginX+Z, LineEndY);
      //Z=Z+wLine/7;
      //Thread.sleep(1000);
      //TimeUnit.SECONDS.sleep(1);
      
    }
    
  }
    
      
  
  
  
  //1st excersice
  /*for (int i=0; i <artists.size(); i++) {
    Artist artist = artists.get(i);
    int sleepWidth = (int)(artist.sleep * vizWidth/maxSleep);

    fill(0);
    rect(hMargin, i* heightPerData + vMargin, sleepWidth, heightPerData-2 );
    fill(255);
    text(artist.name, hMargin+10, i* heightPerData + vMargin+20);
    


    if ( (mouseX> hMargin)&&(mouseX < hMargin+sleepWidth)&&(mouseY>i* heightPerData + vMargin)&&(mouseY<i* heightPerData + vMargin+ heightPerData-2)) {
      fill(60, 60, 60);
      rect(hMargin, i* heightPerData + vMargin, sleepWidth, heightPerData-2 );
      text(artist.sleep, hMargin+5, i* heightPerData + vMargin+20);
    
   //if we click we put the nb of hours    
     if ( (mousePressed)&&(mouseX> hMargin)&&(mouseX < hMargin+sleepWidth)&&(mouseY>i* heightPerData + vMargin)&&(mouseY<i* heightPerData + vMargin+ heightPerData-2)) {
       fill(60, 60, 60);
       rect(hMargin, i* heightPerData + vMargin, sleepWidth, heightPerData-2 );
       text(artist.sleep, hMargin+5, i* heightPerData + vMargin+20);
       fill(255);
       rect(sleepWidth, i* heightPerData + vMargin, sleepWidth/5, heightPerData-2 );
       text(artist.sleep, sleepWidth+sleepWidth/10, i* heightPerData + vMargin);
     }
    */
    }
      
