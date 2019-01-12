class Artist_b {
  String year;
  String  winner;
  String  club;
  String  nationnality;
  boolean selected;
  
  


  Artist_b(TableRow row) {

    //TableRow row pour appeler tout la lib de fonction utilisé a l'interieur
    year = row.getString("Year");
    winner = row.getString("Name");
    club = row.getString("Club");
    nationnality = row.getString("Nationnality");
    selected= false;

  }
}
