import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:wordy_demo/models/general_model.dart';
import 'package:wordy_demo/utils/my_layout.dart';
import 'package:wordy_demo/utils/styles.dart';
import 'package:wordy_demo/widgets/coins_widget.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(20),
      horizontal: AppLayout.getWidth(12)),
      height: AppLayout.getHeight(80),
      decoration: const BoxDecoration(
        color: Color(0XFF21445B),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(4, 0),
            spreadRadius: 4,
            blurRadius: 4,
          )
        ]

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: (){
            Navigator.pop(context);
            //Navigator.push(context,
                //MaterialPageRoute(builder: (context)=>const HomeScreen()));
          },
              child: Container(
                height: AppLayout.getHeight(120),
                width: AppLayout.getWidth(60),
                padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back,size:
                      AppLayout.getHeight(35),weight:900 ,color: const Color(0xFFF0F0F0),),
                  ],
                ),
              )
          ),
          GestureDetector(
            child: Container(
              
              //width: AppLayout.getWidth(90),
              height: AppLayout.getHeight(40),
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(5)),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.2,
                    offset: Offset(0, 3),
                  )
                ]

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
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
                  Gap(AppLayout.getWidth(5)),
                  const CoinsWidget(),
                  Gap(AppLayout.getWidth(5)),
                  Icon(Icons.add_circle,size: AppLayout.getHeight(20),
                    color: const Color(0xFF5D8A66),),


                ],
              ),
            ),
            onTap: (){
              showModalBottomSheet<dynamic>(context: context, builder:(BuildContext bc){
                return Container(
                  height: size.height*0.75,
                  decoration: BoxDecoration(
                    color:const  Color(0X22000000),
                    borderRadius: BorderRadius.vertical(top:Radius.circular(AppLayout.getWidth(15))),
                  ),
                 child: Center(
                   child: Text("Watch this ad to get more coins ",style:
                     Styles.headlineStyle3.copyWith(color: Colors.white,fontFamily: 'dosis_variable'),),
                 ),
                );
              },
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                useSafeArea: true,
              );
              Provider.of<GeneralModel>(context,listen: false
              ).clearCurrentLevel();
              Provider.of<GeneralModel>(context,listen: false
              ).storePlayerLevel();
              Provider.of<GeneralModel>(context,listen: false
              ).setImageName();
              Provider.of<GeneralModel>(context,listen: false
              ).storeImageName();
              Provider.of<GeneralModel>(context,listen: false
              ).keyBoardDrawn=false;
              Provider.of<GeneralModel>(context,listen: false
              ).setWordToFind();
              Provider.of<GeneralModel>(context,listen: false
              ).getKeysForKeyboard();
            },
          )
        ],
      ),
    );
  }
}
