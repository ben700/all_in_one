import 'package:all_in_one/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:voice_recorder/voice_recorder.dart';

class VoiceRecorderFileListScreen extends StatefulWidget {
  final List<dynamic> _fileNameList;
  VoiceRecorderFileListScreen(this._fileNameList);

  @override
  _VoiceRecorderFileListScreenState createState() => _VoiceRecorderFileListScreenState();
}

class _VoiceRecorderFileListScreenState extends State<VoiceRecorderFileListScreen> {
  @override
  Widget build(BuildContext context) {
    return Layout(body: FileListPage(widget._fileNameList));
  }
}
