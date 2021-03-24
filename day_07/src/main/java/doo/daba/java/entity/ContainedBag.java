package doo.daba.java.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@AllArgsConstructor @ToString
public class ContainedBag {
  @Getter
  private int quantity;
  @Getter
  private String name;

  @Override
  public boolean equals(Object bag) {
    return ((ContainedBag) bag).getName() == this.name && ((ContainedBag) bag).getQuantity() == this.quantity;
  }

  @Override
  public int hashCode() {
    int result = quantity;
    result = 31 * result + name.hashCode();
    return result;
  }
}
