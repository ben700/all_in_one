import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:widgets/widgets.dart';

class FilePlayerPage extends StatefulWidget {
  final _file;
  FilePlayerPage(this._file);

  @override
  _FilePlayerPageState createState() => _FilePlayerPageState();
}

class _FilePlayerPageState extends State<FilePlayerPage> {
  late Track track;

  @override
  void initState() {
    super.initState();

    track = Track(trackPath: widget._file.path);
  }

  @override
  Widget build(BuildContext context) {
    var player = SoundPlayerUI.fromTrack(track);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget._file.path.split('/').last),
      ),
      body: Column(
        children: [player],
      ),
    );
  }
}
