import 'package:flutter/material.dart';

class MePageFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MeFragment();
  }

}
class _MeFragment extends State<MePageFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Text("我的",),
      ),
    );
  }

}