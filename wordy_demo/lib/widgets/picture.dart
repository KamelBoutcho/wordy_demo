import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy_demo/utils/my_layout.dart';

import '../models/general_model.dart';


class Picture extends StatefulWidget {
  const Picture({Key? key}) : super(key: key);

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralModel>(
        builder: (context,generalModel,child){
          return FutureBuilder<String>(
            future: generalModel.getImageName(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String imageName = snapshot.data!;
                return Container(
                  margin: EdgeInsets.only(left: AppLayout.getWidth(20),right: AppLayout.getWidth(20),
                      top: AppLayout.getHeight(20),bottom: AppLayout.getHeight(20)),
                  padding: EdgeInsets.all(AppLayout.getWidth(10)),
                  decoration: BoxDecoration(
                    color:  const Color(0x21FFFFFF),
                    borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
                  ),
                  child: Container(
                    height: AppLayout.getHeight(200),
                    padding: EdgeInsets.all(AppLayout.getWidth(10)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
                        image: DecorationImage(
                          image: AssetImage("assets/images/$imageName.jpg"),
                          fit: BoxFit.fill,
                        )
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
