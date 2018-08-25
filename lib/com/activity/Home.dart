import 'package:flutter/material.dart';


import 'package:flutter_app/com/activity/homepage/HomePage.dart';
import 'package:flutter_app/com/activity/homepage/MePage.dart';
import 'package:flutter_app/com/activity/homepage/ShopPage.dart';
import 'package:flutter_app/com/activity/homepage/TypePage.dart';

//创建首页
class HomeActivity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeActivity();
  }

}

class _HomeActivity extends State<HomeActivity>{

  BuildContext context;
  int _tabIndex = 0;

  var appBarTitle = ["首页","商铺","消息","我的"];

  //返回图片
  Image _getImageAsstes(String path){
    return new Image.asset(path,width: 20.0,height: 20.0,);
  }

  Image getTabIcon(int curIndex){
    if(curIndex == _tabIndex){
      return tabImages[curIndex][1];
    }else{
      return tabImages[curIndex][0];
    }
  }

  //设置tab 字体颜色
  Text getTabTitle(int curIndex){
    if(curIndex == _tabIndex){
      return new Text(appBarTitle[curIndex],
        style: new TextStyle(color: Color(0xff63ca6c)),);
    }else{
      return new Text(appBarTitle[curIndex],
        style: new TextStyle(color: Color(0xff888888)),);
    }
  }

  var _bodys;
  var tabImages;
  void initData(){
    //创建管理图片得二位数组
    tabImages = [
      [
        _getImageAsstes("images/home.png"),
        _getImageAsstes("images/homes.png"),
      ],
      [
        _getImageAsstes("images/goshopping.png"),
        _getImageAsstes("images/goshoppings.png"),
      ],
      [
        _getImageAsstes("images/type.png"),
        _getImageAsstes("images/types.png"),
      ],
      [
        _getImageAsstes("images/aboutus.png"),
        _getImageAsstes("images/aboutuss.png"),
      ]
    ];
    //保存页面数组
    _bodys = [

      new HomePageFragment(),
      new TypePageFragment(),
      new ShopPageFragment(),
      new MePageFragment(),

    ];

  }

  //创建一个类
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    this.context = context;
    initData();

    return new Scaffold(

      body: _bodys[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: getTabIcon(0) , title: getTabTitle(0)),
        new BottomNavigationBarItem(icon: getTabIcon(1) , title: getTabTitle(1)),
        new BottomNavigationBarItem(icon: getTabIcon(2) , title: getTabTitle(2)),
        new BottomNavigationBarItem(icon: getTabIcon(3) , title: getTabTitle(3)),
      ],
        //样式
        type: BottomNavigationBarType.fixed,
        //当前索引
        currentIndex: _tabIndex,
        //创建点击监听
        onTap: (index){
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

}