import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/general_model.dart';
import '../utils/my_layout.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(

        margin: EdgeInsets.symmetric(horizontal:AppLayout.getWidth(3),
            vertical: AppLayout.getWidth(4)),
        width: AppLayout.getWidth(84),
        height: AppLayout.getWidth(40),
        decoration: BoxDecoration(
            color:Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(AppLayout.getWidth(5))),
            boxShadow:  [
              BoxShadow(
                  color: Colors.redAccent.withOpacity(0.5),
                  spreadRadius: 1,
                  offset:const Offset(0,2)
              )
            ]
        ),
        child: const Center(
          //child: Text("Delete",style: TextStyle(fontSize: AppLayout.getWidth(20),fontWeight: FontWeight.bold),),
          child: Icon(FluentSystemIcons.ic_fluent_backspace_regular,color:  Color(0xFFF0F0F0),),
        ),
      ),
      onTap: (){
        Provider.of<GeneralModel>(context,listen: false
        ).deleteLastLetter();
        /////////////
        if(Provider.of<GeneralModel>(context,listen: false
        ).firstBoardSelected){
          Provider.of<GeneralModel>(context,listen: false
          ).setIsWord1Found(false);
          print(Provider.of<GeneralModel>(context,listen: false
          ).isWord1Found);
          Provider.of<GeneralModel>(context,listen: false
          ).setIsWord1Completed();

        }
        if(Provider.of<GeneralModel>(context,listen: false
        ).secondBoardSelected){
          Provider.of<GeneralModel>(context,listen: false
          ).setIsWord2Found(false);
          print(Provider.of<GeneralModel>(context,listen: false
          ).isWord2Found);
          Provider.of<GeneralModel>(context,listen: false
          ).setIsWord1Completed();

        }
        if(Provider.of<GeneralModel>(context,listen: false
        ).thirdBoardSelected){
          Provider.of<GeneralModel>(context,listen: false
          ).setIsWord3Found(false);
          print(Provider.of<GeneralModel>(context,listen: false
          ).isWord3Found);
          Provider.of<GeneralModel>(context,listen: false
          ).setIsWord1Completed();

        }


      },
    );
  }
}
