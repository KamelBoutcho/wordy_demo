import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/general_model.dart';
import '../utils/my_layout.dart';

class ShowALetter extends StatelessWidget {
  const ShowALetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralModel>(
        builder: (context,generalModel,child){
          return GestureDetector(
            child: Container(

              margin: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(3),
                  vertical: AppLayout.getWidth(4)),
              width: AppLayout.getWidth(84),
              height: AppLayout.getWidth(40),
              decoration: BoxDecoration(
                  color: const Color(0xFF5D8A66),
                  borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(5))),
                  boxShadow:  [
                    BoxShadow(
                        color: const  Color(0xFF5D8A66).withOpacity(0.6),
                        spreadRadius: 1,
                        offset:const Offset(0,2)
                    )
                  ]
              ),
              child: Center(
                child: Container(
                  width: AppLayout.getWidth(30),
                  height: AppLayout.getHeight(30),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/scope.png"),
                    )
                  ),
                )

              ),

            ),
            /*onTap: (){
              if(generalModel.checkIfWord1IsFound() && generalModel.checkIfWord2IsFound()
              && generalModel.checkIfWord3IsFound()) {
                generalModel.setIsWord1Found(true);
                generalModel.setIsWord2Found(true);
                generalModel.setIsWord3Found(true);
                Future.delayed(const Duration(milliseconds: 1000), () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Bravo !',style: TextStyle(fontWeight: FontWeight.w500,fontSize:
                          AppLayout.getWidth(23),color:  Colors.black,fontFamily:"reighteous")),
                          content: Text('vous avez trouvé les mots ${generalModel.wordToFind1.toLowerCase()}, ${generalModel.wordToFind2.toLowerCase()}, '
                              'et ${generalModel.wordToFind3.toLowerCase()}',
                              style: TextStyle(fontWeight: FontWeight.w500,fontSize:
                              AppLayout.getWidth(23),color:  Colors.red,fontFamily:"reighteous")),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // Add any actions you want to perform when the button is pressed
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
                              },
                              child: Text('Suivant',style: TextStyle(fontWeight: FontWeight.w500,fontSize:
                              AppLayout.getWidth(23),color:  Colors.blue,fontFamily:"reighteous")),
                            ),
                          ],
                        );
                      });
                });

              }
              else {
                generalModel.setIsWord1Found(false);
                generalModel.setIsWord2Found(false);
                generalModel.setIsWord3Found(false);
              }
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
            }*/
          );


        });

  }
}
