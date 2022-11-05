import 'package:airbnb_flutter/utils/Colors.dart';
import 'package:airbnb_flutter/utils/custom_styles/CustomTextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  String name;
  final VoidCallback onPress;

  CustomPrimaryButton({Key? key, required this.name, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // <-- Radius
        ), // This is what you need!
      ),
      onPressed: () {
        onPress();
      },
      child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 12, 4, 12),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 20,
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    name,
                    style: CustomTextStyle.normalWhiteBold,
                  ))
            ],
          )),
    );
  }
}
