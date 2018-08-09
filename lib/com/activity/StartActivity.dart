import 'package:flutter/material.dart';
import 'dart:async';
//启动页
class StartActivity extends StatelessWidget {

  Timer _timer;

  initTimer(BuildContext context){
    //Duration 时间
    _timer = new Timer.periodic(new Duration(milliseconds: 3000), (timer){
      Navigator.of(context).pushNamed('/login');
      _timer.cancel();

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget startView(){
      return new Image.asset("images/ic_splsh.png");
    }
    initTimer(context);
    return startView();
  }

}