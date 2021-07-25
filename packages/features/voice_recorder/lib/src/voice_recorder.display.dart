<<<<<<< HEAD
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
=======
>>>>>>> main
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
<<<<<<< HEAD
import 'package:voice_recorder/voice_recorder.dart';
=======
>>>>>>> main

class VoiceRecorderDisplay extends StatefulWidget {
  const VoiceRecorderDisplay({Key? key}) : super(key: key);

  @override
  _VoiceRecorderDisplayState createState() => _VoiceRecorderDisplayState();
}

class _VoiceRecorderDisplayState extends State<VoiceRecorderDisplay> {
<<<<<<< HEAD
  FlutterSoundRecorder? _recorder = FlutterSoundRecorder();
  bool _isRecorderInited = false;
  String _path = '';
  String _fileName = '';
  List<dynamic> _fileNameList = [];
=======
  FlutterSoundPlayer? _player = FlutterSoundPlayer();
  FlutterSoundRecorder? _recorder = FlutterSoundRecorder();
  bool _isPlayerInited = false;
  bool _isRecorderInited = false;
  bool _isPlaybackReady = false;
  final String _path = 'voice_recorder_example.aac';
>>>>>>> main

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    getFileNameList();
=======

    _player!.openAudioSession().then((value) => setState(() {
          _isPlayerInited = true;
        }));

>>>>>>> main
    _openTheRecord();
  }

  @override
  void dispose() {
    super.dispose();

<<<<<<< HEAD
=======
    _player!.closeAudioSession();
    _player = null;
>>>>>>> main
    _recorder!.closeAudioSession();
    _recorder = null;
  }

<<<<<<< HEAD
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  void getFileNameList() async {
    var filePath = await _localPath;
    setState(() {
      _fileNameList = io.Directory('$filePath/').listSync();
    });
  }

=======
>>>>>>> main
  Future<void> _openTheRecord() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _recorder!.openAudioSession();
    _isRecorderInited = true;
  }

<<<<<<< HEAD
  void _record() async {
    _path = await _localPath;
    _fileName = '$_path/${DateTime.now().toString().replaceAll(RegExp(r'\D'), '')}.acc';
    print('_fileName; $_fileName');
    _recorder!.startRecorder(toFile: _fileName).then((value) => setState(() {}));
  }

  void _stopRecorder() async {
    await _recorder!.stopRecorder().then((value) => setState(() {}));
    getFileNameList();
  }

  void _getRecorder() {
    if (!_isRecorderInited) {
=======
  void _record() {
    _recorder!.startRecorder(toFile: _path).then((value) => setState(() {}));
  }

  void _stopRecorder() async {
    await _recorder!.stopRecorder().then((value) => setState(() {
          _isPlaybackReady = true;
        }));
  }

  void _play() {
    assert(_isPlayerInited && _isPlaybackReady && _recorder!.isStopped && _player!.isStopped);
    _player!.startPlayer(fromURI: _path, whenFinished: () => setState(() {}));
  }

  void _stopPlayer() {
    _player!.stopPlayer().then((value) => setState(() {}));
  }

  void _getRecorder() {
    if (!_isRecorderInited || !_player!.isStopped) {
>>>>>>> main
      return;
    }
    _recorder!.isStopped ? _record() : _stopRecorder();
  }

<<<<<<< HEAD
=======
  void _getPlayback() {
    if (!_isPlayerInited || !_isPlaybackReady || !_recorder!.isStopped) {
      return;
    }
    _player!.isStopped ? _play() : _stopPlayer();
  }

>>>>>>> main
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                icon: Icon(_recorder!.isRecording ? Icons.stop : Icons.circle),
                color: _recorder!.isRecording ? Colors.grey : Colors.red,
                onPressed: () {
                  _getRecorder();
                }),
            Text(_recorder!.isRecording ? '녹음 중입니다' : '버튼을 누르시면 녹음됩니다')
          ],
        ),
<<<<<<< HEAD
        TextButton(
            onPressed: () async {
              setState(() {
                getFileNameList();
              });
              _fileNameList = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FileListPage(_fileNameList)));
            },
            child: Text('File List'))
=======
        Row(
          children: [
            IconButton(
                icon: Icon(_player!.isPlaying ? Icons.stop : Icons.play_arrow),
                color: _player!.isPlaying ? Colors.grey : Colors.blue,
                onPressed: _getPlayback),
            Text(_player!.isPlaying ? '재생 중입니다' : '버튼을 누르시면 재생됩니다')
          ],
        )
>>>>>>> main
      ],
    );
  }
}
