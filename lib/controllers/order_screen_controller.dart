import 'package:flutter/cupertino.dart';
import 'package:shopybee/uitls/enums.dart';

class OrderScreenController with ChangeNotifier {
  OrderScreenNavigationStatus navigationStatus =
      OrderScreenNavigationStatus.address;

  bool usingShopcons = false;

  useShopcons() {
    usingShopcons = true;
    notifyListeners();
  }

  dontUseShopcons() {
    usingShopcons = false;
    notifyListeners();
  }

  setNavigationStatus(OrderScreenNavigationStatus updated) {
    navigationStatus = updated;
    notifyListeners();
  }
}
