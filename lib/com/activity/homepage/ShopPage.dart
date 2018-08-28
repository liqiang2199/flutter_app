import 'package:flutter/material.dart';

/**
 * 购物车
 */
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
      appBar: new AppBar(
        title: new Text("购物车",
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: <Widget>[
          new Text("编辑",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Center(
            child: new Text("暂无可购买列表，点击去购物",
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey
              ),
              textAlign: TextAlign.center,
            ),
            heightFactor: 20.5,
          ),
          new Container(
            color: Colors.grey,
            height: 1.0,
          ),
          _balanceTotal(),
        ],
      ),
    );
  }

  Widget _balanceTotal(){
    return new Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      height: 50.0,
      child: new Row(
        children: <Widget>[
          new Expanded(child:
          new Text("全选",
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
          ),
            flex: 1,
          ),

          new Expanded(child:
            new Text("￥0.00",
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.deepOrangeAccent,
              ),
            ),
            flex: 7,
          ),

          new Expanded(child:
            new RaisedButton(onPressed: (){
              //去结算 按钮点击
            },
              color: Colors.green[400],
              child: new Text("去结算",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            flex: 3,
          ),

        ],
      ),
    );
  }


}