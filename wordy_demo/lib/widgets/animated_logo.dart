import 'package:flutter/material.dart';
import 'package:wordy_demo/utils/my_layout.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  double _left=-400;
  late Size screenSize;
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
         child: SizedBox(
           width: size.width,
           height: AppLayout.getHeight(120),
           child: Stack(
             children: [
               AnimatedPositioned(
                 duration: const Duration(milliseconds: 350),
                 left: _left,
                 child: Container(
                   width: size.width,
                   height: AppLayout.getHeight(120),
                   decoration:  const BoxDecoration(
                     image: DecorationImage(
                         fit: BoxFit.fill,
                         image: AssetImage("assets/images/wordy_logo.png")),
                   ),
                 ),
               ),

             ],
           ),
         )
      );

  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final size = AppLayout.getSize(context);
      setState(() {
        screenSize = size;
      });
      // Call the function that requires the screen size
      updateLogoPosition();
    });
    // call setState after 1 second to update the left position
  }

void updateLogoPosition(){
  Future.delayed(const Duration(milliseconds: 200), () {
    setState(() {
      _left =0;
    });
  });

}


}
