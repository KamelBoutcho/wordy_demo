import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy_demo/utils/my_layout.dart';
import 'package:wordy_demo/widgets/display_letter.dart';
import 'package:wordy_demo/widgets/grey_box.dart';

import '../models/general_model.dart';

class DisplayBoard1 extends StatelessWidget {
  final String wordToFind;
  final int boardId;
  const DisplayBoard1({Key? key,required this.wordToFind,required
   this.boardId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralModel>(
        builder: (context, keyBoardModel, child) {

          return GestureDetector(
            onTap: (){
              if(!keyBoardModel.isWord1Found){
                keyBoardModel.setSelectedBoard(boardId);
              }

            },
            child: Container(
              padding: EdgeInsets.all(AppLayout.getWidth(1)),
              decoration:  BoxDecoration(
                color:keyBoardModel.isBoardSelected(boardId)? const Color(0x21FFFFFF):Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(5))),
                border: Border.all(width: AppLayout.getWidth(1),
                    color:keyBoardModel.isBoardSelected(boardId)? Colors.lightBlueAccent:Colors.transparent),

              ),
              child: SizedBox(
                height: AppLayout.getWidth(39),
                width: AppLayout.getWidth(36) * wordToFind.length,

                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        wordToFind.length,
                            (index) => const GreyBox(),
                      ),
                    ),
                    IgnorePointer(
                      ignoring: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: keyBoardModel.wordLetters1.map((letter) => DisplayLetter(letter: letter))
                            .toList(),
                      ),
                    ),


                  ],
                ),


              ),
            ),
          );
        }


    );
  }
}
