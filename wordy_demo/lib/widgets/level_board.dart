import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/general_model.dart';
import '../utils/my_layout.dart';

class LevelBoard extends StatefulWidget {
  const LevelBoard({Key? key}) : super(key: key);

  @override
  State<LevelBoard> createState() => _LevelBoardState();
}

class _LevelBoardState extends State<LevelBoard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralModel>(
        builder: (context,generalModel,child){
          return FutureBuilder<int>(
            future: generalModel.getPlayerLevel(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int playerLevel = snapshot.data!;
                return Center(
                  child: Text(
                    playerLevel.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: AppLayout.getWidth(25),
                      color: Colors.red,
                      fontFamily: "reighteous",
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        });


  }

}
