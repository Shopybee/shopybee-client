import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/MobileCategoryModel.dart';
import 'package:shopybee/services/api/get_service.dart';

enum MobileCategoryStatus { notFetched, fetching, fetched }

class MobileCategoryScreenController with ChangeNotifier {
  Logger _logger = Logger("MobileCategoryScreenController");
  List<MobileCategoryModel> mobileCategoryList = [];
  GetService _getService = GetService();
  MobileCategoryStatus mobileCategoryStatus = MobileCategoryStatus.notFetched;

  setStatus(MobileCategoryStatus updatedStatus) {
    mobileCategoryStatus = updatedStatus;
  }

  getAllCategories() async {
    setStatus(MobileCategoryStatus.fetching);
    try {
      final response = await _getService.get(endUrl: 'mobile-category/get-all');
      if (response.statusCode == 200) {
        mobileCategoryList =
            mobileCategoryModelFromMap(response.body.toString());
      }
    } catch (error) {
      _logger.shout(error);
    }
    setStatus(MobileCategoryStatus.fetched);
    notifyListeners();
  }
}
