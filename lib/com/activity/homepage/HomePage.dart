import 'package:flutter/material.dart';

class HomePageFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeFragment();
  }

}
class _HomeFragment extends State<HomePageFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Text("首页",),
      ),
    );
  }

}