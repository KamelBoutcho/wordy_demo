import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wordy_demo/utils/my_layout.dart';
import 'package:wordy_demo/utils/styles.dart';
import 'package:wordy_demo/widgets/animated_logo.dart';
import 'package:wordy_demo/widgets/animated_text.dart';
import 'package:wordy_demo/widgets/homescreen_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    final size= AppLayout.getSize(context);
    return Scaffold(
      //container that hold the linear gradient color , it contains a container
      //that holds everything in the screen
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.9],
            colors: [
              Color(0XFF793a4c),
              Color(0XFF000f23),
            ],

          )
        ),
        //the container that holds the column that holds everything
        child: Container(
            padding: EdgeInsets.symmetric(vertical:AppLayout.getHeight(20),
            horizontal: AppLayout.getWidth(20)),
            // the column that holds everything
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top:AppLayout.getHeight(100)),
                  child: SizedBox(
                    height: AppLayout.getHeight(250),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
                            child: const AnimatedLogo()),
                        Gap(AppLayout.getHeight(3)),
                        const AnimatedText(),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                //container that holds a column of containers acting as buttons
                Container(
                  margin: EdgeInsets.only(bottom: AppLayout.getHeight(100)),
                  // that column that lays out the buttons
                  child: Column(
                    children: [
                     const HomeScreenButton(buttonName: "Play"),
                      Gap(AppLayout.getHeight(30)),
                     const HomeScreenButton(buttonName: "Log in") ,
                      Gap(AppLayout.getHeight(30)),
                     const HomeScreenButton(buttonName: "How to play"),

                    ],
                  ),


                ),

              ],
            ),

          ),
        ),
    );
  }
}
