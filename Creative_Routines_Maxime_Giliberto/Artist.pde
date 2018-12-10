class Artist {
  String name;
  float  primaryWork;
  float  sleep;
  float socialMeals;
  float exercice;
  float otherWorks;
  float makingEndsMeet;
  String occupation;


  Artist(TableRow row) {

    //TableRow row pour appeler tout la lib de fonction utilisé a l'interieur
    name = row.getString("Artist");
    primaryWork = row.getFloat("Primary Work");
    sleep = row.getFloat("Sleep");
    socialMeals = row.getFloat("Social and Meals");
    exercice = row.getFloat("Exercise");
    otherWorks = row.getFloat("Other works");
    makingEndsMeet = row.getFloat("Making ends meet");
    occupation = row.getString("Occupation");
  }
  
  float getActivity(String activity) {
    float value = 0;
    switch(activity) {
      case "Primary Work": value = primaryWork; break;
      case "Sleep": value = sleep; break;
      case "Social & Meals": value = socialMeals; break;
      case "Exercise": value = exercice; break;
      case "Other Works": value = otherWorks; break;
      case "Making Ends Meet": value = makingEndsMeet; break;
    }
    return value;
  }
}
