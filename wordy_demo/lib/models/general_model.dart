import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralModel extends ChangeNotifier{

  //DISPLAY BOARD SELECTION
  bool firstBoardSelected=true;
  bool secondBoardSelected=false;
  bool thirdBoardSelected=false;

  bool _board1OnGame=true;
  bool _board2OnGame=true;
  bool _board3OnGame=true;


  void setSelectedBoard(int id){
    switch (id) {
      case 1 :
        firstBoardSelected=true;
        secondBoardSelected=false;
        thirdBoardSelected=false;
        break;
      case 2 :
        secondBoardSelected=true;
        firstBoardSelected=false;
        thirdBoardSelected=false;
        break;
      case 3 :
        thirdBoardSelected=true;
        secondBoardSelected=false;
        firstBoardSelected=false;
        break;
    }
    //notifyListeners();
  }

  bool isBoardSelected(int id){
    switch (id){
      case 1 :
        return firstBoardSelected;
      case 2 :
        return secondBoardSelected;
      case 3 :
        return thirdBoardSelected;
      default :
        return firstBoardSelected;

    }


  }
  void resetSelectedBoard(){
    firstBoardSelected=true;
    secondBoardSelected=false;
    thirdBoardSelected=false;
    notifyListeners();
  }

  //NEW DATA MANAGEMENT GOES HERE
  late List<List<String>> levelWords=[];
  String _wordToFind1='';
  String _wordToFind2='';
  String _wordToFind3='';
  int _currentLevel=1;

  void initialSetLevelWord (List<List<String>> wordsList){
    levelWords=wordsList;
  }

  void initialSetCurrentLevel(int level){
    _currentLevel=level;
  }

  bool _onTransition=true;

  void setOnTransition(trans){
    _onTransition=trans;
  }
  bool isOnTransition(){
    return _onTransition;
  }



////////////////////////////////////////////
  List<String> allLetters1=[];
  List<String> allLetters2=[];
  List<String> allLetters3=[];
  List<String> additionalLetters1=[];
  List<String> additionalLetters2=[];
  List<String> additionalLetters3=[];

  bool keyBoardDrawn=false;

  int _coins=100;
  String _imageName='image_1';
String _letterSelected='';
  String _lastTapped='';
  bool isWord1Found=false;
  bool isWord2Found=false;
  bool isWord3Found=false;
  bool _isWord1Completed=false;
  bool _isWord2Completed=false;
  bool _isWord3Completed=false;
 List<String> _wordletters1=[];
  List<String> _wordletters2=[];
  List<String> _wordletters3=[];
int id=0;

String get letterSelected => _letterSelected;
List get wordLetters1 => _wordletters1;
  List get wordLetters2 => _wordletters2;
  List get wordLetters3 => _wordletters3;
String get lastLetterTapped => _lastTapped;
String get wordToFind1 => _wordToFind1;
String get wordToFind2 => _wordToFind2;
String get wordToFind3 => _wordToFind3;


List<String> usedIds1=[];
List<String> usedIds2=[];
List<String> usedIds3=[];

  void setCurrentLevel() {
      _currentLevel +=1;
      if(_currentLevel>levelWords.length-2){
        _currentLevel=1;
      }
      notifyListeners();

  }
void storeLevelFromData(int level){
    _currentLevel=level;
}
  void clearCurrentLevel(){
    _currentLevel=1;
    notifyListeners();
  }
  int getCurrentLevel(){
    return _currentLevel;

  }
void setCoins(int coins){
  _coins=coins;
}

void setBackIsWord1Completed(bool completed){
  _isWord1Completed=completed;
  //notifyListeners();
}
  void setBackIsWord2Completed(bool completed){
    _isWord2Completed=completed;
    //notifyListeners();
  }
  void setBackIsWord3Completed(bool completed){
    _isWord3Completed=completed;
    //notifyListeners();
  }

void setIsWord1Found(bool found){
  isWord1Found=found;
  //notifyListeners();
}
  void setIsWord2Found(bool found){
    isWord2Found=found;
    //notifyListeners();
  }
  void setIsWord3Found(bool found){
    isWord3Found=found;
    //notifyListeners();
  }
bool get isWord1Completed => _isWord1Completed;
  bool get isWord2Completed => _isWord2Completed;
  bool get isWord3Completed => _isWord3Completed;
void setIsWord1Completed(){
  if(wordLetters1.length==_wordToFind1.length){
    _isWord1Completed=true;
  }
  else {
    _isWord1Completed=false;
  }
  //notifyListeners();
}
  void setIsWord2Completed(){
    if(wordLetters2.length==_wordToFind2.length){
      _isWord2Completed=true;
    }
    else {
      _isWord2Completed=false;
    }
    //notifyListeners();
  }
  void setIsWord3Completed(){
    if(wordLetters3.length==_wordToFind3.length){
      _isWord3Completed=true;
    }
    else {
      _isWord3Completed=false;
    }
    //notifyListeners();
  }
void cancelIsWord1Completed(){
  _isWord1Completed=false;
}
  void cancelIsWord2Completed(){
    _isWord2Completed=false;
  }
  void cancelIsWord3Completed(){
    _isWord3Completed=false;
  }


void setLetterSelected(String letter,Key? key){
  if(firstBoardSelected){
    _letterSelected=letter;
    usedIds1.add(key.toString());
    print(usedIds1);
    setWordLetters();
  }
  if(secondBoardSelected){
    _letterSelected=letter;
    usedIds2.add(key.toString());
    print(usedIds2);
    setWordLetters();
  }
  if(thirdBoardSelected){
    _letterSelected=letter;
    usedIds3.add(key.toString());
    print(usedIds3);
    setWordLetters();
  }
  notifyListeners();
}
void clearLettersSelected(){
  usedIds1=[];
  usedIds2=[];
  usedIds3=[];
}
void setWordLetters(){
  if(firstBoardSelected){
    _wordletters1.add(_letterSelected);
  }
  if(secondBoardSelected){
    _wordletters2.add(_letterSelected);
  }
  if(thirdBoardSelected){
    _wordletters3.add(_letterSelected);
  }
}
void clearDisplayBoard(){
  _wordletters1=[];
  _wordletters2=[];
  _wordletters3=[];
}
void deleteLastLetter(){
  if(firstBoardSelected && _wordletters1.isNotEmpty){
    _lastTapped = _wordletters1.last;
    _wordletters1.removeLast();
    usedIds1.removeLast();
  }
  if(secondBoardSelected && _wordletters2.isNotEmpty){
    _lastTapped = _wordletters2.last;
    _wordletters2.removeLast();
    usedIds2.removeLast();
  }
  if(thirdBoardSelected && _wordletters3.isNotEmpty){
    _lastTapped = _wordletters3.last;
    _wordletters3.removeLast();
    usedIds3.removeLast();
  }
  notifyListeners();

}
bool isLetterUsed(String letter){
  if(wordLetters1.contains(letter)){
    return true;
  }
  else {
    return false;
  }
}
int getLetterId(int position){
  id= position;
  return id ;
}
void setWordToFind(){
  if(_currentLevel>levelWords.length-2){
    _currentLevel=1;
  }
  _wordToFind1=levelWords[_currentLevel][0];
  _wordToFind2=levelWords[_currentLevel][1];
  _wordToFind3=levelWords[_currentLevel][2];
}

bool checkIfWord1IsFound (){


  if(wordLetters1.join()==_wordToFind1){
    if(_board1OnGame){
      _board1OnGame=false;
      if(!isWord2Found){
        setSelectedBoard(2);
        return true;
      }
      if(!isWord3Found){
        setSelectedBoard(3);
      }

    }
    return true;
  }
  else{
    _board1OnGame=true;
    return false;
  }

}
  bool checkIfWord2IsFound (){


    if(wordLetters2.join()==_wordToFind2){

      if(_board2OnGame){
        _board2OnGame=false;
        if(!isWord3Found){
          setSelectedBoard(3);
          return true;
        }
        if(!isWord1Found){
          setSelectedBoard(1);
        }

      }
      return true;


    }
    else{
      _board2OnGame=true;
      return false;
    }

  }
  bool checkIfWord3IsFound (){


    if(wordLetters3.join()==_wordToFind3){
       if(_board3OnGame){
         _board3OnGame=false;
         if(!isWord1Found){
           setSelectedBoard(1);
           return true;
         }
         else if(!isWord2Found){
           setSelectedBoard(2);
         }
       }
      return true;
    }
    else{
      _board3OnGame=true;
      return false;
    }

  }
//level model logic here //
  Future<void> storePlayerLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('playerLevel',_currentLevel);
    notifyListeners();
  }

  Future<int> getPlayerLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int level = prefs.getInt('playerLevel') ?? 1;
    return level;

  }
  // coins logic here//
  Future<void> storePlayerCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('playerCoins',10+_coins);
    notifyListeners();
  }
  Future<int> getPlayerCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int level = prefs.getInt('playerCoins') ?? 100;
    return level;

  }
  //picture logic goes here //
void setImageName(){
  _imageName='image_$_currentLevel';
  notifyListeners();
}
  Future<void> storeImageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imageName',_imageName);
    notifyListeners();
  }

  Future<String> getImageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String imageName = prefs.getString('imageName') ?? 'image_1';
    notifyListeners();
    return imageName;

  }

  //word from csv logic goes here//
  void setLevelWords ()async{
  List<List<String>>words=await readLevelWords();
   print(levelWords);
   if(levelWords.isEmpty){
     levelWords=words;
     notifyListeners();
   }

  }
  Future<List<List<String>>> readLevelWords() async {
    String csvData = await rootBundle.loadString('assets/WORDY_WORDS.csv');

    // Split the CSV data into lines
    List<String> lines = csvData.split('\n');
    List<List<String>> wordsList = [];

    for (String line in lines) {
      List<String> words = line.split(',');

      // Remove any leading/trailing whitespaces from each word
      words = words.map((word) => word.trim()).toList();

      // Add the words to the main list
      wordsList.add(words);
    }

    notifyListeners();

    if(wordsList.isNotEmpty){
      notifyListeners();
      return wordsList;

    }
    else{
      notifyListeners();
      return [['']];
    }

  }
//KEY BOARD CODE GOES HERE
void getKeysForKeyboard(){
  if(!keyBoardDrawn){
    //FIRST WORD KEYBOARD
    print('my test word to find : $_wordToFind1');
    additionalLetters1=generateAdditionalLetters(_wordToFind1);
    allLetters1 =_wordToFind1.split('');
    allLetters1+=additionalLetters1;
    allLetters1.shuffle();
    allLetters1.insert(14, 'Show_a_letter');
    allLetters1.insert(18, 'Delete');
    //SECOND WORD KEYBOARD
    print('my test word to find : $_wordToFind2');
    additionalLetters2=generateAdditionalLetters(_wordToFind2);
    allLetters2 =_wordToFind2.split('');
    allLetters2+=additionalLetters2;
    allLetters2.shuffle();
    allLetters2.insert(14, 'Show_a_letter');
    allLetters2.insert(18, 'Delete');

    //THIRD WORD KEYBOARD
    print('my test word to find : $_wordToFind3');
    additionalLetters3=generateAdditionalLetters(_wordToFind3);
    allLetters3 =_wordToFind3.split('');
    allLetters3+=additionalLetters3;
    allLetters3.shuffle();
    allLetters3.insert(14, 'Show_a_letter');
    allLetters3.insert(18, 'Delete');


    keyBoardDrawn=true;
  }

}
  List<String> generateAdditionalLetters(String myWord) {
    List<String> additionalLetters = [];
    int additionalLettersCount = 17-myWord.length; // Subtract 2 for Submit and Delete buttons
    for (int i = 0; i < additionalLettersCount; i++) {

      additionalLetters.add(getRandomLetter());
    }
    return additionalLetters;
  }

  String getRandomLetter() {
    Random random = Random();
    int randomCode = random.nextInt(26) + 65; // Generate random code between 65 and 90 (ASCII range for A to Z)
    return String.fromCharCode(randomCode);
  }
}


