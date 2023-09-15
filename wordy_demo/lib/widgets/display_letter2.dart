import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/general_model.dart';
import '../utils/my_layout.dart';


class DisplayLetter2 extends StatefulWidget {
  final String letter ;
  const DisplayLetter2({Key? key,required this.letter}) : super(key: key);

  @override
  State<DisplayLetter2> createState() => _DisplayLetter2State();
}

class _DisplayLetter2State extends State<DisplayLetter2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralModel>(
        builder: (context,generalModel,child){
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(3),
                  vertical: AppLayout.getWidth(4)),
              width: AppLayout.getWidth(30),
              height: AppLayout.getWidth(31),
              decoration: BoxDecoration(
                color:generalModel.isWord2Completed? (generalModel.isWord2Found? Colors.green
                    :Colors.red):const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(1))),
              ),
              child: Center(
                child: Text(widget.letter,style: TextStyle(
                    color:generalModel.isWord2Completed? Colors.white : Colors.black
                    ,fontSize: AppLayout.getWidth(23),fontWeight: FontWeight.bold),),
              ),
            ),
            onTap: (){


            },
          );

        });
  }
}
