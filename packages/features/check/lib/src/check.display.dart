import 'package:flutter/material.dart';

class CheckDisplay extends StatefulWidget {
  @override
  _CheckDisplay createState() => _CheckDisplay();
}

class _CheckDisplay extends State<CheckDisplay> {
  bool check = false;
  @override
  Widget build(_) {
    return Container(
      child: Column(
        children: [
          Text("운동여부 확인"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("운동했나?"),
              IconButton(
                onPressed: () {
                  setState(() {
                    check = !check;
                  });
                },
                icon: Icon(Icons.check),
              ),
              Text(check? "잘했다" : "정신차려"),
            ],
          ),
        ],
      ),
    );
  }
}
