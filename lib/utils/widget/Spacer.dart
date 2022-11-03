import 'package:flutter/cupertino.dart';

class CustomSpacer extends StatelessWidget {
  final double height;

  const CustomSpacer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: height);
  }
}
