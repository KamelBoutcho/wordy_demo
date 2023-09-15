import 'package:flutter/material.dart';

import '../utils/my_layout.dart';

class GreyBox extends StatelessWidget {
  const GreyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(3),
          vertical: AppLayout.getWidth(4)),
      width: AppLayout.getWidth(30),
      height: AppLayout.getWidth(31),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(1))),
      ),
    );
  }
}
