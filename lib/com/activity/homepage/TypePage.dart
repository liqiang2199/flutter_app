import 'package:flutter/material.dart';

class TypePageFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TypeFragment();
  }

}
class _TypeFragment extends State<TypePageFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Text("商品分类",),
      ),
    );
  }

}