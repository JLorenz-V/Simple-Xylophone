import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(
  home: XylophoneApp(),
));

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  Future<void> playSound(int soundNumber) async {
    final newPlayer = AudioPlayer();
    await newPlayer.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded soundTile({required Color color, required int soundNumber, required String text}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(color),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Rounded edge
              ),
            ),
            elevation: WidgetStateProperty.all(10),
            overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
          ),
          onPressed: () {
            playSound(soundNumber);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.music_note, color: Colors.white, size: 30),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC0C0C0), //
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            soundTile(color: Colors.red, soundNumber: 1, text: "C"),
            soundTile(color: Colors.orange, soundNumber: 2, text: "D"),
            soundTile(color: Colors.yellow, soundNumber: 3, text: "E"),
            soundTile(color: Colors.green, soundNumber: 4, text: "F"),
            soundTile(color: Colors.teal, soundNumber: 5, text: "G"),
            soundTile(color: Colors.blue, soundNumber: 6, text: "A"),
            soundTile(color: Colors.purple, soundNumber: 7, text: "B"),
          ],
        ),
      ),
    );
  }
}
