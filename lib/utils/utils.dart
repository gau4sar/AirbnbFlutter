import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static changeFocusNode(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg, backgroundColor: Colors.black, textColor: Colors.white);
  }

  static flushBarErrorMessage(String msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: msg,
          duration: Duration(seconds: 5),
        )..show(context));
  }

  static snackBar(String msg, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  static log(String msg) {
    if (kDebugMode) {
      print(msg);
    }
  }

  String getPropertyIcon(String? propertyType) {

    switch (propertyType) {
      case "Apartment":
        return "assets/apartment.png";
      case "House":
        return "assets/house.png";
      case "Bed & Breakfast":
        return "assets/bed_and_breakfast.png";
      case "Condominium":
        return "assets/condominium.png";
      case "Loft":
        return "assets/loft.png";
      case "Townhouse":
        return "assets/town_house.png";
      case "Timeshare":
        return "assets/timeshare.png";
      case "GuestHouse":
        return "assets/guest_house.png";
      default:
        return "assets/apartment.png";
    }
  }
}
