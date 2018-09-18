import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_app/com/activity/textactivity/TextActivity.dart';

class TextActivityDartMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final flutterWebviewPlugin = new TextPlugin();
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("访问原生界面和传递数据到原生界面",
          style: new TextStyle(color: Colors.white,fontSize: 18.0,),
          textAlign: TextAlign.center,
        ),
      ),
      body: new Center(
        child: new RaisedButton(onPressed: () {

          flutterWebviewPlugin.launch(
              "https://blog.csdn.net/qq_16247851/article/details/81210771",
                  (data) {
//                setState(() {
//                  title = data;
//                });
              },
              rect: new Rect.fromLTWH(0.0, 0.0, MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height));
        },
          child: const Text("点击传递到原生数据上面",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22.0,
              color: Colors.blue
            ),
          ),
        ),

      ),
    );
  }

}