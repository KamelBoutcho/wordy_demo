import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../models/general_model.dart';
import '../utils/my_layout.dart';

class CoinsWidget extends StatelessWidget {
  const CoinsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralModel>(
        builder: (context,generalModel,child){
          return FutureBuilder<int>(
            future: generalModel.getPlayerCoins(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int playerCoins = snapshot.data!;
                generalModel.setCoins(playerCoins);
                return Text(playerCoins.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF323050),
                      fontFamily: 'reighteous',
                      fontSize: AppLayout.getWidth(15)),);
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
