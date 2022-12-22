import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final assetsPlayer = AssetsAudioPlayer();
  void playSound({required int soundNo}){
    assetsPlayer.open(Audio('assets/note$soundNo.wav'));
  }
  Expanded buildKey({required int soundNo, required Color color, required flexNo}){
    return Expanded(
      flex: flexNo,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          primary: Colors.black,
        ),
        onPressed: (){
          playSound(soundNo: soundNo);
        },
        child: Text(''),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(soundNo: 1, color: Colors.red, flexNo: 2),
              buildKey(soundNo: 2, color: Colors.yellow, flexNo: 2),
              buildKey(soundNo: 3, color: Colors.blue, flexNo: 2),
              buildKey(soundNo: 4, color: Colors.grey, flexNo: 2),
              buildKey(soundNo: 5, color: Colors.green, flexNo: 2),
              buildKey(soundNo: 6, color: Colors.purple, flexNo: 2),
              buildKey(soundNo: 7, color: Colors.teal, flexNo: 2),
            ],
          ),
        ),
      ),
    );
  }
}

