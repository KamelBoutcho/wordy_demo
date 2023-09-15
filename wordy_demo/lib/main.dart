import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wordy_demo/screens/game_screen.dart';
import 'package:wordy_demo/screens/home_screen.dart';

import 'models/general_model.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context)=>GeneralModel(),
        child: const MyApp(),)
  );


}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  // This widget is the root of your application.
  bool isFullScreen=false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor:
    Colors.transparent));
  }
  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeMetrics() {
    final mediaQueryData = MediaQuery.of(context);
    setState(() {
      isFullScreen = mediaQueryData.size.height == mediaQueryData.padding.top;
    });
    if(!isFullScreen){
      Future.delayed(const Duration(seconds: 4),(){
        SystemChrome.restoreSystemUIOverlays();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordy Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/game_screen':(context) =>const GameScreen(),
      },
    );
  }
}
