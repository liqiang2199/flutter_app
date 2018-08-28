import 'package:flutter/material.dart';
import 'package:carousel/carousel.dart';
import 'dart:ui';
import 'package:flutter_app/com/view/ViewUtils.dart';

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
      body: new ListView(
        children: <Widget>[

          new Column(
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
                  top:20.0,
                ),
              ),

//          new Divider(
//            height: 15.0,
//            color: Colors.white70,
//          ),


              //动态加入列表
              //_dayPromotion("精品推荐"),
              //GridView 的列表加载
              //_GridShopList(),

              new Column(
                children: _titleFind(2),
              ),
              //所有商品列表
              _shopList(),

            ],
          )

        ],
      ),
    );
  }

  //加载不同分类
  List<Widget> _titleFind(int num){
    List<Widget> findWi = new List();
    for(int i = 0;i<num;i++){
      if(i == 0){
        findWi.add(_dayPromotion("精品推荐"));
      }
      if(i == 1){
        findWi.add(_dayPromotion("天天厂家促销"));
      }
    }

    return findWi;
  }

  Widget _title(String title){
    return //先创建 标题
      new Row(
        children: <Widget>[

          new Container(
            margin: new EdgeInsets.only(
              left: 10.0,
            ),
            color: Colors.green,
            width: 5.0,
            height: 30.0,

          ),

          new Container(
            margin: const EdgeInsets.only(
              left: 10.0,
            ),
          ),

          new Text(title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontStyle: FontStyle.normal,

            ),
          ),

        ],
      );
  }

  //精品推荐  天天特价促销
  Widget _dayPromotion(String title){
    return new Column(
      children: <Widget>[

        _title(title),

        new Container(
          margin: const EdgeInsets.only(
            top: 10.0,
          ),
        ),

        //创建内容
//        new ListView(
//          children: _listView(),
//        ),

        //GridView 的列表加载
        _GridShopList(),



//        new Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: _GridShopList(),
//        ),



      ],
    );
  }

  //创建内容
  /**
   * new Column(

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
      )
   */
  _listView(){
    List<Widget> list = [];

    for(int i =0;i<3;i++){
      list.add(_viewGird());
    }

    return list;
  }

  /**
   * 加载 GirdView 格式的数据
   */

  _GridShopList(){
    return new GridView.count(
        crossAxisCount: 3,
      //padding: const EdgeInsets.all(8.0),
      primary: false,
      mainAxisSpacing: 0.0,//竖向间距
      crossAxisSpacing: 8.0,//横向间距
      children: _getGrid(),
      shrinkWrap: true,

    );
  }

  List<Widget> _getGrid(){
    List<Widget> gridList = new List();
    for(int i =0;i<6;i++){
      gridList.add(_viewGird());
    }
    return gridList;
  }
  /**
   * 所有商品 列表
   */
  Widget _shopList(){
    return new Column(
      children: <Widget>[
        _title("全部商品"),
//        new ListView(
//          children: _allShopList(),
//        ),
        new Column(
          children: _allShopList(),
        ),

      ],
    );

  }

  List<Widget> _allShopList(){
    List<Widget> allList = new List();
    for(int i = 0;i<10;i++){
      allList.add(ViewUtils().shopListView(window.physicalSize.width));
    }
    return allList;
  }

  //GridView 对活动商品分类
  Widget _viewGird(){
    return new Column(

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
    );
  }




}