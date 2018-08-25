import 'package:flutter/material.dart';
import 'package:carousel/carousel.dart';
import 'dart:ui';

/**
 * window.physicalSize.width 获取屏幕宽度 需要（import 'dart:ui';）
 */

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
      appBar: new AppBar(
        title: new Text("首页",
            textAlign: TextAlign.center,
            // ignore: conflicting_dart_import
            style: new TextStyle(color: Colors.white,fontSize: 18.0),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: null,
      ),
      body: new Column(
        children: <Widget>[

          new Directionality(textDirection: TextDirection.ltr, child:

          // 资源图片
          new Image.asset('imgs/logo.jpeg'),

          ),

          new SizedBox(
            height: 180.0,
            child: new Carousel(
              children: [

                new NetworkImage('http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg'),
                new NetworkImage('http://img06.tooopen.com/images/20160818/tooopen_sy_175866434296.jpg'),
                new NetworkImage('http://img06.tooopen.com/images/20160818/tooopen_sy_175833047715.jpg'),
                new NetworkImage('https://flutter.io/images/homepage/header-illustration.png'),

              ].map((netImage)=> new Image(
                image: netImage,fit: BoxFit.fitWidth,height: 180.0,width: window.physicalSize.width,
              )).toList(),

              animationDuration: new Duration(
                seconds: 5000,
              ),
            ),
          ),

          //new Image.asset("images/test_image.jpg",fit: BoxFit.fitWidth,height: 180.0,width: window.physicalSize.width,),
          new Container(
            margin: new EdgeInsets.only(
              top: 15.0,
            ),
          ),
          //一行数据
          new Row(
            //一行之间平等间距
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              //显示一列数据
              new Column(
                children: <Widget>[
                  new Image.asset("images/main_brand.png",fit: BoxFit.fill,width: 50.0,height: 50.0,),
                  new Text("品牌",textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.black,fontSize: 16.0,
                  ),)
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),

              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Image.asset("images/main_discount.png",fit: BoxFit.fill,width: 50.0,height: 50.0,),
                  new Text("天天抽奖",textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.black,fontSize: 16.0,
                    ),)
                ],
              ),

              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Image.asset("images/main_time_kill.png",fit: BoxFit.fill,width: 50.0,height: 50.0,),
                  new Text("限时秒杀",textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.black,fontSize: 16.0,
                    ),)
                ],
              ),

            ],
          ),

          new Container(
            margin: new EdgeInsets.only(
              top: 10.0,
            ),
          ),


          //动态加入列表
//          new ListView(
//            children: <Widget>[
//              //_dayPromotion("精品推荐"),
//
//              //_listView(),
//
//            ],
//          ),
          _dayPromotion("精品推荐"),

        ],
      ),
    );

  }

  //精品推荐  天天特价促销
  Widget _dayPromotion(String title){
    return new Column(
      children: <Widget>[
        //先创建 标题
        new Text(title,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
            fontStyle: FontStyle.italic,

          ),
        ),
        //创建内容

//        new ListView(
//          children: _listView(),
//        ),

        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _listView(),
        ),

      ],
    );
  }
  //创建内容
  _listView(){
    List<Widget> list = [];

    for(int i =0;i<6;i++){
      list.add(new Column(

        children: <Widget>[
          //图片
          new Image.asset("images/main_discount.png",
            width: 60.0,
            height: 60.0,
          ),
          //名字
          new Text("轮胎",
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          //价格
          new Text("￥1500.0",
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.amberAccent,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ));
    }

    return list;
  }

}