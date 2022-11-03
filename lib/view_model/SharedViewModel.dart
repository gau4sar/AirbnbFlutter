import 'package:airbnb_flutter/repository/AirbnbListingRpository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/model/AirbnbModel.dart';
import '../utils/Constant.dart';
import '../utils/routes/RoutesName.dart';
import '../utils/utils.dart';

class SharedViewModel extends ChangeNotifier {

  final AirbnbListingRepository AirbnbRepo;

  SharedViewModel({required this.AirbnbRepo});

  //Login
  bool _isGetAirbnbListingApiLoading = false;

  setLoading(bool value) {
    _isGetAirbnbListingApiLoading = value;
    notifyListeners();
  }

  bool get isGetAirbnbListingApiLoading => _isGetAirbnbListingApiLoading;

  Future<dynamic> getAirbnbListing(BuildContext context) async {
    setLoading(true);
    AirbnbRepo.getAirbnbListing().then((value) {

      var toAirbnbModel = AirbnbModel.fromJson(value);

      setAirbnbLists(toAirbnbModel);

      setLoading(false);
      Utils.log("Success -> ${toAirbnbModel.nhits} ${toAirbnbModel.records?.first.fields?.country}");

      notifyListeners();

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      Utils.log("Error -> ${error.toString()}");
    });
  }

  List<Records>? _listOfSpaces;

  List<Records>? get listOfSpaces => _listOfSpaces;

  setAirbnbLists(AirbnbModel airbnbModel) {
    _listOfSpaces = airbnbModel.records;
    notifyListeners();
  }

  /*void getValue() async {

    AirbnbRepo.getValue().then((value) {
      setToken(value);
    });
  }*/
}
