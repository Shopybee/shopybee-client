import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/CategoryModel.dart';
import 'package:shopybee/services/api/get_service.dart';

enum CategoryStatus { notFetched, fetched, fetching }

class CategoryController with ChangeNotifier {
  List<CategoryModel> categories = [];
  CategoryStatus categoryStatus = CategoryStatus.notFetched;
  final Logger logger = Logger('Category Controller');
  final GetService _getService = GetService();

  setCategoryStatus(CategoryStatus updatedStatus) {
    categoryStatus = updatedStatus;
  }

  getAllCategories() async {
    setCategoryStatus(CategoryStatus.fetching);
    List<CategoryModel> tempList = [];
    try {
      final response = await _getService.get(endUrl: 'category/get-all');
      if (response.statusCode == 200) {
        tempList = categoryModelFromMap(response.body.toString());
      }
    } catch (error) {
      logger.severe(error.toString());
    }
    categories = tempList;
    setCategoryStatus(CategoryStatus.fetched);
    notifyListeners();
  }
}
