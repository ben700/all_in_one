import 'package:all_in_one/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:voice_recorder/voice_recorder.dart';

class VoiceRecorderFilePlayerScreen extends StatefulWidget {
  final _file;
  VoiceRecorderFilePlayerScreen(this._file);

  @override
  _VoiceRecorderFilePlayerScreenState createState() => _VoiceRecorderFilePlayerScreenState();
}

class _VoiceRecorderFilePlayerScreenState extends State<VoiceRecorderFilePlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Layout(body: FilePlayerPage(widget._file));
  }
}
