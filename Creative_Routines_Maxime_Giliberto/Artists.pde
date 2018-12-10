import java.util.Collections;
import java.util.Comparator;
//import java.util.HashMap;
import java.util.LinkedHashMap;
//import java.util.Map;

import static java.util.stream.Collectors.*;
import static java.util.Map.Entry.*;


class Artists {
  ArrayList<Artist> alist;

  String[] activities = {"Sleep", "Primary Work", "Social & Meals", "Exercise", "Other Works", "Making Ends Meet"};
  FloatDict mins = new FloatDict();
  FloatDict maxs = new FloatDict();
  FloatDict variances = new FloatDict();
  FloatDict averages = new FloatDict();

  Artists(String filename) {
    alist = new ArrayList<Artist>();
    Table table = loadTable(filename, "header");

    for (TableRow row : table.rows()) {
      alist.add(new Artist(row));
    }
    
    for (String activity : activities) {
      float min=24;
      float max=0;
      ArrayList<Double> values = new ArrayList<Double>();

      for (Artist artist : alist) {
        values.add((double)artist.getActivity(activity));

        if (artist.getActivity(activity)<min)
          min=artist.getActivity(activity);

        if (artist.getActivity(activity)>max)
          max=artist.getActivity(activity);
      }
      mins.set(activity,min);
      maxs.set(activity, max);
      //print(maxs);
      variances.set(activity, (float)variance(values));
      averages.set(activity, (float)average(values));
    }
    variances.sortValuesReverse();
  }
}
