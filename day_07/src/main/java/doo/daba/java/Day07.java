package doo.daba.java;

import doo.daba.java.entity.Bag;
import doo.daba.java.util.Parser;
import doo.daba.java.util.Reader;

import java.io.IOException;
import java.util.List;

public class Day07 {
  public static void main(String[] args) throws IOException {
    List<String> lines = Reader.readFromInputStream(Day07.class.getResourceAsStream("/short_input.txt"));
    Parser parser = new Parser();
    lines.forEach(line -> {
      parser.addLine(line);
    });

    StringBuilder bags = new StringBuilder();
    StringBuilder related_bags = new StringBuilder();

    parser.getBags().forEach((name, innerBags) -> {
      bags.append("INSERT INTO bag (bag_name) VALUES ('")
          .append(name).append("');\n");
      innerBags.forEach(innerBag -> {
        related_bags.append("\n  INSERT INTO bag_relationship (bag_id, quantity, related_bag_id) VALUES (")
            .append("(SELECT bag_id from bag WHERE bag_name='")
            .append(name).append("'), ").append(innerBag.getQuantity()).append(", ").append("(SELECT bag_id from bag WHERE bag_name='")
            .append(innerBag.getName()).append("'));");
      });
    });
    System.out.println(bags.toString());
    System.out.println(related_bags.toString());
  }
}
