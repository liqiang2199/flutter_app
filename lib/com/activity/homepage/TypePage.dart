import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_app/com/view/ViewUtils.dart';

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
      appBar: new AppBar(
        title: new Text("商品分类",
          style: new TextStyle(color: Colors.white,fontSize: 18.0,),
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: _shopPageView(),
    );
  }

  Widget _shopPageView(){
    return new Row(
      children: <Widget>[
        //分类类型
        new Container(
          width: window.physicalSize.width/12,
          child: new ListView(
            children: _shopTypeList(),
          ),
        ),

        //分类类型对应的商品
//        new Expanded(child:
//        ),

        new Container(
          color: Colors.white,
          //width: window.physicalSize.width - 764,
          //width: 320.0,
          /**
           * 导入 import dart:ui ；
              就可以直接这样：
              window.devicePixelRatio 获取设备像素比；
              window.physicalSize  获取屏幕尺寸；
           */
          width: window.physicalSize.width/window.devicePixelRatio - window.physicalSize.width/12,
          child: new ListView(
            shrinkWrap: true,
            children: _shopList(context),
          ),
        ),


      ],
    );
  }

  List<Widget> _shopList(BuildContext context){
    List<Widget> shops = new List();
    for (int i = 0;i<15;i++){
      shops.add(ViewUtils().shopListView(context,0.0));
    }
    //print("    屏幕宽度 ${window.physicalSize.width/2.6 - window.physicalSize.width/12}  和高度 ${window.physicalSize.height}    ");
    //print("    屏幕宽度 ${window.physicalSize.width/2.625 - window.physicalSize.width/12}  和像素比 ${window.devicePixelRatio}    ");
    return shops;
  }
  List<String> typeList = ["玛吉斯","金鱼","大力士","普利司通","斯达飞","兴源","金路"
  ,"万宝","风神","万里","富力通","和平","玉麒麟","金刚","朝阳","千里马"];

  //商品类型 显示
  Widget _shopTypeText(String typeTitle){
    return new Container(
      padding: const EdgeInsets.all(15.0),
      child: new Text(
          typeTitle,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.grey
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
  List<Widget> _shopTypeList(){
    List<Widget> types = new List();
    for (int i = 0;i < typeList.length;i++){
      types.add(_shopTypeText(typeList[i]));
    }
    return types;
  }

}