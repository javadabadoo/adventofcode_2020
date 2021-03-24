package doo.daba.java.entity;

import lombok.Getter;
import lombok.ToString;

import java.util.HashMap;

@ToString
public class Bag {
  @Getter
  private String name;
  private HashMap<String, ContainedBag> containedBags;

  public Bag(String name, ContainedBag... containedBags) {
    this.name = name;
    this.containedBags = new HashMap<>();
    if (containedBags != null ) {
      for (ContainedBag equivalenceBag : containedBags) {
        this.containedBags.put(equivalenceBag.getName(), equivalenceBag);
      }
    }
  }

  public ContainedBag getEquivalcenceBag(String bagName) {
    return this.containedBags.get(bagName);
  }
}
