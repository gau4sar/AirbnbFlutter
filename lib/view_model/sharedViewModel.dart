import 'dart:collection';

import 'package:airbnb_flutter/repository/AirbnbListingRepository.dart';
import 'package:airbnb_flutter/utils/Colors.dart';
import 'package:airbnb_flutter/utils/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/model/AirbnbModel.dart';
import '../utils/utils.dart';

class SharedViewModel extends ChangeNotifier {
  TextEditingController? searchTextFieldLatestController;
  String selectedCountry = Constant.I_M_FLEXIBLE;
  String latestSearchQuery = "";

  final AirbnbListingRepository airbnbRepo;

  SharedViewModel({required this.airbnbRepo});

  List<String?>? _listOfPropertyTypes = List.empty();

  List<String?>? get listOfPropertyTypes => _listOfPropertyTypes;

  setAirbnbPropertyTypes(List<String?>? propertyTypes) {
    _listOfPropertyTypes = propertyTypes;
    notifyListeners();
  }

  List<String> _listOfCountry = [Constant.I_M_FLEXIBLE];

  List<String> get listOfCountry => _listOfCountry;

  setCountryList(List<String> countries) {
    _listOfCountry = countries;
    notifyListeners();
  }

  List<String> getListOfFilteredCountry(String searchQuery) {
    var filteredList = listOfCountry.where((element) =>
        element.toLowerCase().contains(searchQuery.toLowerCase()) == true);

    return filteredList.toList();
  }

  bool _isGetAirbnbListingApiLoading = false;

  setLoading(bool value) {
    _isGetAirbnbListingApiLoading = value;
    notifyListeners();
  }

  bool get isGetAirbnbListingApiLoading => _isGetAirbnbListingApiLoading;

  Future<dynamic> getAirbnbListing(BuildContext context) async {
    setLoading(true);
    airbnbRepo.getAirbnbListing().then((value) {
      var toAirbnbModel = AirbnbModel.fromJson(value);

      setAirbnbLists(toAirbnbModel);

      var toPropertyList = AirbnbModel.fromJson(value)
          .records
          ?.map((records) => records.fields?.propertyType)
          .where((element) => element != null)
          .toList();

      List<String> propertyTypes =
          LinkedHashSet<String>.from(toPropertyList!).toList();

      setAirbnbPropertyTypes(propertyTypes);

      setLoading(false);

      /*List<Facets?>? facets = List.empty();*/
      var facets = toAirbnbModel.facetGroups
          ?.where((element) => element.name == "country")
          .toList();

      var listOfCountry =
          facets?.map((e) => e.facets).first?.map((e) => e.name).toList();

      if (listOfCountry?.isNotEmpty == true) {
        for (var i = 0; i < listOfCountry!.length; i++) {
          Utils.log("toAirbnbModel ${listOfCountry[i]}");
        }
      }

      Utils.log(
          "listoffilteredcountry ${listOfCountry?.where((element) => element?.toLowerCase().contains("u") == true)}");

      List<String> notNullableList = List.empty(growable: true);
      notNullableList.add("I'm Flexible");

      int length = listOfCountry?.length == null ? 0 : listOfCountry!.length;

      for (var i = 0; i < length; i++) {
        Utils.log("notNullableList for loop ${listOfCountry![i]}");
        if (listOfCountry[i] != null) {
          notNullableList.add(listOfCountry[i]!);
        }
      }

      Utils.log("notNullableList ${notNullableList.first}");

      setCountryList(notNullableList);

      /*for (var i = 0; i < toAirbnbModel.facetGroups!.length; i++) {
        if (toAirbnbModel.facetGroups![i].name == "country") {
          for (var j = 0;
              j < toAirbnbModel.facetGroups![i].facets!.length;
              j++) {
            Utils.log(
                "facets -> ${toAirbnbModel.facetGroups?[i].facets?[j].name}");
          }
        }
      }*/

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

  Color getBorderColor(String listViewDestinationsRecord) {
    if (selectedCountry == listViewDestinationsRecord) {
      return AppColors.blackColor;
    } else {
      return AppColors.transparent;
    }
  }

  double getBorderWidth(String listViewDestinationsRecord) {
    if (selectedCountry == listViewDestinationsRecord) {
      return 2;
    } else {
      return 0;
    }
  }

  void clearAllValues() {
    latestSearchQuery = "";
    searchTextFieldLatestController?.text = "";
    selectedCountry = Constant.I_M_FLEXIBLE;

    notifyListeners();
  }

/*void getValue() async {

    AirbnbRepo.getValue().then((value) {
      setToken(value);
    });
  }*/
}
