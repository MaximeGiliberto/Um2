public static double sum(ArrayList<Double> list) {
    double sum = 0.0;        
    for(int i=0; i<list.size(); i++ ){
        sum = sum + list.get(i) ;
    }
    return sum;
}

// Copy here average from exercise 64 
public static double average(ArrayList<Double> list) {  
    double average = sum(list)/list.size();
    return average;
}

public static double variance(ArrayList<Double> list) {
   double sumDiffsSquared = 0.0;
   double avg = average(list);
   for (double value : list)
   {
       double diff = value - avg;
       diff *= diff;
       sumDiffsSquared += diff;
   }
   return sumDiffsSquared  / (list.size()-1);
}
