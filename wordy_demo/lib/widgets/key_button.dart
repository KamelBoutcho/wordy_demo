import 'package:flutter/material.dart';
import 'package:wordy_demo/models/general_model.dart';
import 'package:wordy_demo/utils/my_layout.dart';
import 'package:provider/provider.dart';

class KeyButton extends StatefulWidget {

  final String letter ;
  const KeyButton({Key? key,required this.letter}) : super(key: key);

  @override
  State<KeyButton> createState() => _KeyButtonState();
}

class _KeyButtonState extends State<KeyButton> {



  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralModel>(
        builder: (context,keyBoardModel,child){
          if(keyBoardModel.secondBoardSelected){

            return GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(3),
                    vertical: AppLayout.getWidth(4)),
                width: AppLayout.getWidth(39),
                height: AppLayout.getWidth(40),
                decoration: BoxDecoration(
                    color: keyBoardModel.usedIds2.contains(widget.key.toString())?  Colors.transparent : const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(5))),
                    boxShadow: [
                      BoxShadow(
                          color: keyBoardModel.usedIds2.contains(widget.key.toString())?  Colors.transparent : const Color(0xFFA0A0A0) ,
                          spreadRadius: 0.7,
                          offset:const Offset(0,2)
                      )
                    ]
                ),
                child: Center(
                  child: Text(widget.letter,style: TextStyle(
                      color: keyBoardModel.usedIds2.contains(widget.key.toString())?  Colors.transparent :  Colors.black
                      ,fontSize: AppLayout.getWidth(23),fontWeight: FontWeight.bold),),
                ),
              ),
              onTap: (){
                if(!keyBoardModel.usedIds2.contains(widget.key.toString())
                    &&keyBoardModel.wordLetters2.length<keyBoardModel.wordToFind2.length){
                  Provider.of<GeneralModel>(context,listen: false
                  ).setLetterSelected(widget.letter,widget.key);
                }

              },
            );
          }
          if(keyBoardModel.thirdBoardSelected){

            return GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(3),
                    vertical: AppLayout.getWidth(4)),
                width: AppLayout.getWidth(39),
                height: AppLayout.getWidth(40),
                decoration: BoxDecoration(
                    color: keyBoardModel.usedIds3.contains(widget.key.toString())?  Colors.transparent : const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(5))),
                    boxShadow: [
                      BoxShadow(
                          color: keyBoardModel.usedIds3.contains(widget.key.toString())?  Colors.transparent : const Color(0xFFA0A0A0) ,
                          spreadRadius: 0.7,
                          offset:const Offset(0,2)
                      )
                    ]
                ),
                child: Center(
                  child: Text(widget.letter,style: TextStyle(
                      color: keyBoardModel.usedIds3.contains(widget.key.toString())?  Colors.transparent :  Colors.black
                      ,fontSize: AppLayout.getWidth(23),fontWeight: FontWeight.bold),),
                ),
              ),
              onTap: (){
                if(!keyBoardModel.usedIds3.contains(widget.key.toString())
                    &&keyBoardModel.wordLetters3.length<keyBoardModel.wordToFind3.length){
                  Provider.of<GeneralModel>(context,listen: false
                  ).setLetterSelected(widget.letter,widget.key);
                }

              },
            );
          }
          else {

            return GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(3),
                    vertical: AppLayout.getWidth(4)),
                width: AppLayout.getWidth(39),
                height: AppLayout.getWidth(40),
                decoration: BoxDecoration(
                    color: keyBoardModel.usedIds1.contains(widget.key.toString())?  Colors.transparent : const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(5))),
                    boxShadow: [
                      BoxShadow(
                          color: keyBoardModel.usedIds1.contains(widget.key.toString())?  Colors.transparent : const Color(0xFFA0A0A0) ,
                          spreadRadius: 0.7,
                          offset:const Offset(0,2)
                      )
                    ]
                ),
                child: Center(
                  child: Text(widget.letter,style: TextStyle(
                      color: keyBoardModel.usedIds1.contains(widget.key.toString())?  Colors.transparent :  Colors.black
                      ,fontSize: AppLayout.getWidth(23),fontWeight: FontWeight.bold),),
                ),
              ),
              onTap: (){
                if(!keyBoardModel.usedIds1.contains(widget.key.toString())
                    &&keyBoardModel.wordLetters1.length<keyBoardModel.wordToFind1.length){
                  Provider.of<GeneralModel>(context,listen: false
                  ).setLetterSelected(widget.letter,widget.key);
                }

              },
            );
          }
        });
  }
}
