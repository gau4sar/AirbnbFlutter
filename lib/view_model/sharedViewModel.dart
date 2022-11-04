import 'dart:collection';

import 'package:airbnb_flutter/repository/AirbnbListingRpository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/model/AirbnbModel.dart';
import '../utils/utils.dart';

class SharedViewModel extends ChangeNotifier {
  List<String?>? _listOfPropertyTypes = List.empty();

  List<String?>? get listOfPropertyTypes => _listOfPropertyTypes;

  setAirbnbPropertyTypes(List<String?>? propertyTypes) {
    _listOfPropertyTypes = propertyTypes;
    notifyListeners();
  }

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

      var toPropertyList = AirbnbModel.fromJson(value)
          .records
          ?.map((records) => records.fields?.propertyType)
          .where((element) => element != null)
          .toList();

      List<String> result =
          LinkedHashSet<String>.from(toPropertyList!).toList();

      setAirbnbPropertyTypes(result);

      setLoading(false);

      for (var i = 0; i < toAirbnbModel.facetGroups!.length; i++) {

        if(toAirbnbModel.facetGroups![i].name=="property_type") {
          for (var j = 0; j <
              toAirbnbModel.facetGroups![i].facets!.length; j++) {
            Utils.log(
                "facets -> ${toAirbnbModel.facetGroups?[i].facets?[j].name}");
          }
        }
      }

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
