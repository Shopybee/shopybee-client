import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/MobileModel.dart';
import 'package:shopybee/services/api/get_service.dart';

enum DisplayMobileStatus {fetched,fetching,notFetched}

class DisplayMobileController with ChangeNotifier{
  GetService _getService = GetService();
  Logger _logger = Logger("DisplayMobileController");

  //DisplayMobileStatus status=DisplayMobileStatus.notFetched;
  List<MobileModel> listOfMobiles = [];
  Map<int,DisplayMobileStatus> status= {};

  setStatus(int brandId,DisplayMobileStatus updated){
    status[brandId]=updated;
    notifyListeners();
  }

  getAllMobilesByBrand(int brandId)async{
    setStatus(brandId,DisplayMobileStatus.fetching);
    try{
      final response = await _getService.get(endUrl: 'mobiles/getAll/${brandId}');
      if(response.statusCode == 200){
        listOfMobiles = mobileModelFromMap(response.body.toString());
      }
    }
    catch(error){
      _logger.shout(error.toString());
    }
    setStatus(brandId,DisplayMobileStatus.fetched);
    notifyListeners();
  }
}