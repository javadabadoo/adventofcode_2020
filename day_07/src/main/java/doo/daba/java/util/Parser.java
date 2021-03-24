package doo.daba.java.util;

import doo.daba.java.entity.ContainedBag;
import lombok.Getter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Parser {

  @Getter
  HashMap<String, List<ContainedBag>> bags;


  public Parser() {
    this.bags = new HashMap<>();
  }

  public void addLine(String line) {
    String[] bagsDefinition = line.split(" bags contain");
    String bagName = bagsDefinition[0];
    List<ContainedBag> innerBags = this.parseContainedBags(bagsDefinition[1]);
    this.bags.put(bagName, innerBags);
  }

  private List<ContainedBag> parseContainedBags(String containedBagsLine) {
    List<ContainedBag> containedBags = new ArrayList<>();
    for (String containedBag : containedBagsLine.split(",")) {
      String quantity = this.regexTextExtractor("[0-9]+", containedBag);
      String bags = this.regexTextExtractor("[a-zA-Z]+ [a-zA-Z]+ bag", containedBag);
      containedBags.add(new ContainedBag(quantity == null ? 0 : Integer.parseInt(quantity), bags.substring(0, bags.lastIndexOf(" bag"))));
    }
    return containedBags;
  }

  private String regexTextExtractor(String regex, String text) {
    Pattern pattern = Pattern.compile(regex);
    Matcher matcher = pattern.matcher(text);
    String matchedText = null;
    if (matcher.find()) {
      matchedText = matcher.group();
    }
    return matchedText;
  }

}
