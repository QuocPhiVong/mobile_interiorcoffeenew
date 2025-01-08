class TPricingCalculator {

  //tinh theo thue + ship fee
  static double calculateTotalPrice(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  //tinh phi ship
  static String calculateShippingCost(double productPrice, String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  //tinh thue
  static String calculateTax(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  //tinh thue dua tren khu vuc (moi quoc gia co muc thue khac nhau)
  static double getTaxRateForLocation(String location){
    //mac dinh thue la 10%
    return 0.10;
  }

  //tinh phi ship hang theo khoang cach
  static double getShippingCost(String location){
    return 5.00;
  }

  //tinh tong tat ca cac gia tri trong cart va tra ve gia tien tong
  //static double calculateCartTotal(CartModel cart){
  //  return cart.items.map((e => e.price).fold(0, (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  //}

}