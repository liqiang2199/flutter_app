import 'package:flutter/material.dart';

class ShopPageFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ShopFragment();
  }

}
class _ShopFragment extends State<ShopPageFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Text("购物车",),
      ),
    );
  }

}