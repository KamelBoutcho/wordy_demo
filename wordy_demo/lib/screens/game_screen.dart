import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wordy_demo/utils/my_layout.dart';
import 'package:wordy_demo/utils/styles.dart';
import 'package:wordy_demo/widgets/custom_appbar.dart';
import 'package:wordy_demo/widgets/display_board.dart';
import 'package:wordy_demo/widgets/display_board2.dart';
import 'package:wordy_demo/widgets/display_board3.dart';
import 'package:wordy_demo/widgets/level_board.dart';
import 'package:wordy_demo/widgets/picture.dart';
import '../models/general_model.dart';

import '../widgets/keyboard.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  void initState(){
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Consumer<GeneralModel>(
        builder: (context,generalModel,child){
          //CHECKING IF WORDS ARE FOUND AND LEVEL IS COMPLETED

          /////////////////////////////////////////////////////////
          return FutureBuilder(
            future: Future.wait([
              generalModel.readLevelWords(),
              generalModel.getPlayerLevel(),
            ]),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                List<List<String>> levelWords= snapshot.data![0];
                int currentLevel= snapshot.data![1];
                generalModel.initialSetLevelWord(levelWords);
                generalModel.initialSetCurrentLevel(currentLevel);
                generalModel.setWordToFind();
                generalModel.getKeysForKeyboard();
                generalModel.setIsWord1Completed();
                generalModel.setIsWord2Completed();
                generalModel.setIsWord3Completed();
                if(generalModel.checkIfWord1IsFound()){
                  generalModel.setIsWord1Found(true);
                }
                if(generalModel.checkIfWord2IsFound()){
                  generalModel.setIsWord2Found(true);
                }
                if(generalModel.checkIfWord3IsFound()){
                  generalModel.setIsWord3Found(true);
                }

                //TRANSITION TO THE NEXT LEVEL
                if(generalModel.isOnTransition()){
                  if(generalModel.checkIfWord1IsFound() && generalModel.checkIfWord2IsFound()
                      && generalModel.checkIfWord3IsFound()) {
                    generalModel.setOnTransition(false);
                    generalModel.setIsWord1Found(true);
                    generalModel.setIsWord2Found(true);
                    generalModel.setIsWord3Found(true);
                    Future.delayed(const Duration(milliseconds: 200), () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // Add any actions you want to perform when the button is pressed
                            return Dialog(
                              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppLayout.getWidth(10))),
                              backgroundColor: Colors.transparent,

                              child: Container(
                                height: AppLayout.getWidth(200),
                                width: AppLayout.getWidth(450),
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/images/bravo.png"),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Center(
                                        child:
                                          Text('Completed',style: TextStyle(fontWeight: FontWeight.bold,fontSize:
                                          AppLayout.getWidth(40),letterSpacing:3,color:  Colors.green,fontFamily:"reighteous",
                                              shadows: const [
                                                Shadow( // bottomLeft
                                                    offset: Offset(-1.5, -1.5),
                                                    color: Colors.black
                                                ),
                                                Shadow( // bottomRight
                                                    offset: Offset(1.5, -1.5),
                                                    color: Colors.black
                                                ),
                                                Shadow( // topRight
                                                    offset: Offset(1.5, 1.5),
                                                    color: Colors.black
                                                ),
                                                Shadow( // topLeft
                                                    offset: Offset(-1.5, 1.5),
                                                    color: Colors.black
                                                ),
                                              ])),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: AppLayout.getWidth(25),
                                          width: AppLayout.getWidth(25),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/coin_wordy_xsmall.png"),
                                                fit: BoxFit.fill,

                                              )
                                          ),
                                        ),
                                        Gap(AppLayout.getWidth(10)),
                                        Text('+10',style: TextStyle(fontWeight: FontWeight.bold,fontSize:
                                        AppLayout.getWidth(30),color:  Colors.green,fontFamily:"reighteous",letterSpacing:3,
                                            shadows: const [
                                              Shadow( // bottomLeft
                                                  offset: Offset(-1.5, -1.5),
                                                  color: Colors.black
                                              ),
                                              Shadow( // bottomRight
                                                  offset: Offset(1.5, -1.5),
                                                  color: Colors.black
                                              ),
                                              Shadow( // topRight
                                                  offset: Offset(1.5, 1.5),
                                                  color: Colors.black
                                              ),
                                              Shadow( // topLeft
                                                  offset: Offset(-1.5, 1.5),
                                                  color: Colors.black
                                              ),
                                            ])),
                                      ],
                                    )
                                  ],
                                ),

                              ),
                            );
                          });
                    });
                    Future.delayed(const Duration(milliseconds: 5200),(){
                      generalModel.storePlayerCoins();
                      generalModel.setCurrentLevel();
                      generalModel.storePlayerLevel();
                      generalModel.setWordToFind();
                      generalModel.keyBoardDrawn = false;
                      generalModel.getKeysForKeyboard();
                      print('test word to find : ${generalModel
                          .wordToFind1}');
                      generalModel.setImageName();
                      generalModel.storeImageName();
                      generalModel.clearDisplayBoard();
                      generalModel.clearLettersSelected();
                      generalModel.setIsWord1Found(false);
                      generalModel.setIsWord2Found(false);
                      generalModel.setIsWord3Found(false);
                      generalModel.cancelIsWord1Completed();
                      generalModel.cancelIsWord2Completed();
                      generalModel.cancelIsWord3Completed();
                      generalModel.resetSelectedBoard();
                      Navigator.of(context).pop();
                      generalModel.setOnTransition(true);
                    });

                  }
                  /*else {
                    generalModel.setIsWord1Found(false);
                    generalModel.setIsWord2Found(false);
                    generalModel.setIsWord3Found(false);
                  }*/
                  generalModel.setIsWord1Completed();
                  generalModel.setIsWord2Completed();
                  generalModel.setIsWord3Completed();
                  if(!generalModel.isWord1Found){
                    Future.delayed(const Duration(milliseconds: 500),(){
                      generalModel.setBackIsWord1Completed(false);
                    });
                  }
                  if(!generalModel.isWord2Found){
                    Future.delayed(const Duration(milliseconds: 500),(){
                      generalModel.setBackIsWord2Completed(false);
                    });
                  }
                  if(!generalModel.isWord3Found){
                    Future.delayed(const Duration(milliseconds: 500),(){
                      generalModel.setBackIsWord3Completed(false);
                    });
                  }
                }


                //END OF THE TRANSITION


                /*if(generalModel.getCurrentLevel()==generalModel.levelWords.length){
                  generalModel.clearCurrentLevel();
                  generalModel.storePlayerLevel();
                  generalModel.setImageName();
                  generalModel.storeImageName();
                  generalModel.keyBoardDrawn=false;
                  generalModel.clearDisplayBoard();
                  generalModel.clearLettersSelected();
                  generalModel.setIsWordFound(false);
                  generalModel.cancelIsWordCompleted();
                  generalModel.setWordToFind();
                  generalModel.getKeysForKeyboard();
                }*/
                return Scaffold(
                  body: Stack(
                    children: [
                      Container(
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            const Column(
                              children:[
                                CustomAppBar(),
                                Picture(),
                              ],
                            ),
                            //const DisplayedWord(),
                            DisplayBoard1(wordToFind:levelWords[currentLevel][0],boardId: 1,),
                            DisplayBoard2(wordToFind:levelWords[currentLevel][1],boardId: 2,),
                            DisplayBoard3(wordToFind:levelWords[currentLevel][2],boardId: 3,),
                            CustomKeyboard(wordToFind:levelWords[currentLevel][0]),
                          ],
                        ),
                      ),
                      Positioned(
                        top: AppLayout.getHeight(15),
                        left: size.width / 2 - AppLayout.getWidth(35),

                        child:  Container(
                          width: AppLayout.getWidth(70),
                          height: AppLayout.getHeight(45),
                          padding: EdgeInsets.symmetric(vertical: AppLayout.getWidth(3),
                              horizontal: AppLayout.getWidth(5)),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(AppLayout.getWidth(70)),
                          ),

                          child:const LevelBoard(),



                        ),
                      ),
                    ],
                  ),


                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          );


            },
          );



  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
}
