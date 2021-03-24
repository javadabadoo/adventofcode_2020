package doo.daba.java.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class Reader {
  public static List<String> readFromInputStream(InputStream inputStream) throws IOException {
    List<String> lines = new ArrayList<>();
    try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream))) {
      String line;
      while ((line = bufferedReader.readLine()) != null) {
        lines.add(line);
      }
    }
    return lines;
  }
}
