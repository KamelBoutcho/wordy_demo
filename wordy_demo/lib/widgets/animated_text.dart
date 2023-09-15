import 'package:flutter/material.dart';

import '../utils/my_layout.dart';
import '../utils/styles.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  double _right=400;
  late Size screenSize;
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
        child: SizedBox(
          width: size.width,
          height: AppLayout.getHeight(50),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 350),
                left: _right,
                  child: SizedBox(
                    width:size.width,
                    child: Center(
                      child: Text("Guess the words",style: Styles.headlineStyle1.copyWith(
                          color: const Color(0xFFF0F0F0),fontWeight: FontWeight.w300,
                          shadows:[ const Shadow(
                            blurRadius: 8,
                            color: Colors.black54,
                            offset: Offset(0,5),

                          )]
                      ),
                      ),
                    ),
                  ),

              )
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
      updateTextPosition();
    });
    // call setState after 1 second to update the left position
  }
  void updateTextPosition(){
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _right =0;
      });
    });

  }

}
