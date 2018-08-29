import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_app/com/view/ViewUtils.dart';
import 'package:flutter/cupertino.dart';
/**
 * 商品详情
 */
class ShopDetailActivity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ShopDetail();
  }
}

class ShopDetail extends State<ShopDetailActivity> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("商品详情",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
      ),
      
      body: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[

              //加载框
              new CupertinoActivityIndicator(),

              new RaisedButton(onPressed: (){},
                child: new Text("测试Buton的宽度"),
                color: Colors.deepOrange,
              ),

              new FloatingActionButton(onPressed: (){

              },
                child: new Text("FloatingActionButton测试"),
                backgroundColor: Colors.red,
              ),

              new FlatButton(onPressed: (){}, child:
              new Text("FlatButton测试"),

              ),

              new OutlineButton(onPressed: (){},
                child: new Text("OutlineButton测试"),
              ),

              new Padding(padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(child:
                    new RaisedButton(onPressed: (){
                      print("  我点击了  Padding  下的  RaisedButton");
                    },
                      //通过控制 Text 的边距来控制控件的高度
                      child: new Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                        child: new Text("Padding测试Buton的宽度"),
                      ),
                      color: Colors.deepOrange,
                    ),
                    ),
                  ],
                ),
              ),

//          new Container(
//            height: 100.0,
//            child: new RaisedButton(onPressed: (){
//              //print("  点击了  Container  RaisedButton  ");
//            },
//              child: new ListView(
//                children: _listView(),
//              ),
//              color: Colors.deepOrange,
//            ),
//          ),

          new Column(
            children: _listView(),
          ),

//              new RaisedButton(onPressed: (){
//                print("  点击了  Container  RaisedButton 12 ");
//              },
//                child:  new Text("_listText ",
//                  style: const TextStyle(
//                    fontSize: 16.0,
//                    color: Colors.black,
//                  ),
//                ),
////            color: Colors.blue,
//              ),

//              new Container(
//                width: window.physicalSize.width,
//                height: 60.0,
//                child: new RaisedButton(onPressed: (){
//                  print("  点击了  Container  RaisedButton  123");
//                },
//                  child:  new Text("_listText ",
//                    style: const TextStyle(
//                      fontSize: 16.0,
//                      color: Colors.black,
//                    ),
//                  ),
//                  color: Colors.white,
//                ),
//              ),

              //_listText(1),
             // _btnList(1),

//          new ListView.builder(
//            itemBuilder:(BuildContext context, int index) {
//                return _btnList(index);
//            },
//            itemCount: 10,
//          ),

//            new Expanded(child:
//              new ListView(
//                shrinkWrap: true,
//                children: _listView(),
//              ),
//            ),


//              new Flexible(child:
//                  new ListView(
//                    shrinkWrap: true,
//                    children: _listView(),
//                  ),
//                flex: 1,
//              ),


            ],
          ),
        ],
      ),
    );
  }

  Widget _listText(int index){

    return new Container(
      width: window.physicalSize.width,
      height: 60.0,
      child: new RaisedButton(onPressed: (){
        print("  点击了  Container  RaisedButton  $index");
      },
        child:  new Text("_listText $index",
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        color: Colors.white,
      ),
    );
  }

  Widget _btnList(int index){
    return new RaisedButton(onPressed: (){
      print("  点击了  Container  RaisedButton  $index");
    },
      child:  new Text("_listText $index",
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
      color: Colors.white,
    );
  }

  List<Widget> _listView(){
    List<Widget> list = new List();

    for (int i = 0;i<10;i++){
      list.add(_listText(i));
    }
    return list;
  }
}