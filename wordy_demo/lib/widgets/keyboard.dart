import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy_demo/utils/my_layout.dart';
import 'package:wordy_demo/widgets/delete_button.dart';
import 'package:wordy_demo/widgets/key_button.dart';
import 'package:wordy_demo/widgets/show_a_letter.dart';
import 'dart:math';
import 'package:wordy_demo/models/general_model.dart';

class CustomKeyboard extends StatefulWidget {
  final String wordToFind;

  const CustomKeyboard({
    Key? key,
    required this.wordToFind,
  }) : super(key: key);

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();

}

class _CustomKeyboardState extends State<CustomKeyboard> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final size = AppLayout.getSize(context);

    List<List<String>> keyboard1Rows = [];
    List<List<String>> keyboard2Rows = [];
    List<List<String>> keyboard3Rows = [];
    List <String> currentRow = [];


    return Consumer<GeneralModel>(
        builder: (context,keyBoardModel,child){

          //FIRST KEYBOARD
          for (String letter in keyBoardModel.allLetters1) {
            currentRow.add(letter);
            if (currentRow.length == 7) {
              keyboard1Rows.add(currentRow);
              currentRow = [];
            }
          }
          if (currentRow.isNotEmpty) {
            keyboard1Rows.add(currentRow);
          }
          //SECOND KEYBOARD
          currentRow = [];
          for (String letter in keyBoardModel.allLetters2) {
            currentRow.add(letter);
            if (currentRow.length == 7) {
              keyboard2Rows.add(currentRow);
              currentRow = [];
            }
          }
          if (currentRow.isNotEmpty) {
            keyboard2Rows.add(currentRow);
          }
          //THIRD KEYBOARD
          currentRow = [];
          for (String letter in keyBoardModel.allLetters3) {
            currentRow.add(letter);
            if (currentRow.length == 7) {
              keyboard3Rows.add(currentRow);
              currentRow = [];
            }
          }
          if (currentRow.isNotEmpty) {
            keyboard3Rows.add(currentRow);
          }


          if(keyBoardModel.firstBoardSelected){

            return Container(
              padding: EdgeInsets.only(bottom: AppLayout.getHeight(3)),
              margin: EdgeInsets.only(
                left: AppLayout.getWidth(30),
                right: AppLayout.getWidth(30),
                top: AppLayout.getHeight(20),
                bottom: AppLayout.getHeight(30),
              ),
              height: AppLayout.getWidth(160),
              decoration: BoxDecoration(
                color: const Color(0x21FFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(12))),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: keyboard1Rows.asMap().entries.map((rowEntry) {
                  int rowIndex = rowEntry.key;
                  List<String> row = rowEntry.value;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: row.asMap().entries.map((letterEntry) {
                      int letterIndex = letterEntry.key;
                      String letter = letterEntry.value;
                      if (letter == 'Show_a_letter') {
                        return const ShowALetter();
                      } else if (letter == 'Delete') {
                        return const DeleteButton();
                      } else {
                        return KeyButton(
                          letter: letter,
                          key: Key('row_$rowIndex' + '_letter_$letterIndex'),
                        );
                      }
                    }).toList(),
                  );
                }).toList(),

              ),

            );

          }
          if(keyBoardModel.secondBoardSelected){

            return Container(
              padding: EdgeInsets.only(bottom: AppLayout.getHeight(3)),
              margin: EdgeInsets.only(
                left: AppLayout.getWidth(30),
                right: AppLayout.getWidth(30),
                top: AppLayout.getHeight(20),
                bottom: AppLayout.getHeight(30),
              ),
              height: AppLayout.getWidth(160),
              decoration: BoxDecoration(
                color: const Color(0x21FFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(12))),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: keyboard2Rows.asMap().entries.map((rowEntry) {
                  int rowIndex = rowEntry.key;
                  List<String> row = rowEntry.value;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: row.asMap().entries.map((letterEntry) {
                      int letterIndex = letterEntry.key;
                      String letter = letterEntry.value;
                      if (letter == 'Show_a_letter') {
                        return const ShowALetter();
                      } else if (letter == 'Delete') {
                        return const DeleteButton();
                      } else {
                        return KeyButton(
                          letter: letter,
                          key: Key('row_$rowIndex' + '_letter_$letterIndex'),
                        );
                      }
                    }).toList(),
                  );
                }).toList(),
              ),

            );

          }
          if(keyBoardModel.thirdBoardSelected){
            return Container(
              padding: EdgeInsets.only(bottom: AppLayout.getHeight(3)),
              margin: EdgeInsets.only(
                left: AppLayout.getWidth(30),
                right: AppLayout.getWidth(30),
                top: AppLayout.getHeight(20),
                bottom: AppLayout.getHeight(30),
              ),
              height: AppLayout.getWidth(160),
              decoration: BoxDecoration(
                color: const Color(0x21FFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(12))),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: keyboard3Rows.asMap().entries.map((rowEntry) {
                  int rowIndex = rowEntry.key;
                  List<String> row = rowEntry.value;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: row.asMap().entries.map((letterEntry) {
                      int letterIndex = letterEntry.key;
                      String letter = letterEntry.value;
                      if (letter == 'Show_a_letter') {
                        return const ShowALetter();
                      } else if (letter == 'Delete') {
                        return const DeleteButton();
                      } else {
                        return KeyButton(
                          letter: letter,
                          key: Key('row_$rowIndex' + '_letter_$letterIndex'),
                        );
                      }
                    }).toList(),
                  );
                }).toList(),
              ),

            );
          }
          else{
            return Container(
              padding: EdgeInsets.only(bottom: AppLayout.getHeight(3)),
              margin: EdgeInsets.only(
                left: AppLayout.getWidth(30),
                right: AppLayout.getWidth(30),
                top: AppLayout.getHeight(20),
                bottom: AppLayout.getHeight(30),
              ),
              height: AppLayout.getWidth(160),
              decoration: BoxDecoration(
                color: const Color(0x21FFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(12))),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: keyboard1Rows.asMap().entries.map((rowEntry) {
                  int rowIndex = rowEntry.key;
                  List<String> row = rowEntry.value;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: row.asMap().entries.map((letterEntry) {
                      int letterIndex = letterEntry.key;
                      String letter = letterEntry.value;
                      if (letter == 'Submit') {
                        return const ShowALetter();
                      } else if (letter == 'Delete') {
                        return const DeleteButton();
                      } else {
                        return KeyButton(
                          letter: letter,
                          key: Key('row_$rowIndex' + '_letter_$letterIndex'),
                        );
                      }
                    }).toList(),
                  );
                }).toList(),
              ),

            );
          }



        });



  }

}
