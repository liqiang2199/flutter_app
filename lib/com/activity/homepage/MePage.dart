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
      appBar: new AppBar(
        //不显示 返回按钮
        automaticallyImplyLeading: false,
        title: new Text("我的",
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            _meImageHeader(),
            new Container(
              margin: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 15.0,
                bottom: 10.0,
              ),
            ),
            _imagesMe(),
            //_me("dd"),

            new Container(
              margin: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 10.0,
                bottom: 10.0,
              ),
            ),

            new Column(
              children: _mesList(),
            ),

          ],
        ),
      ),
    );
  }

  //个人中心
  Widget _meImageHeader(){
    return new Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 20.0,
        bottom: 10.0,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          /**
           * 使用 Expanded 平分 布局显示
           */
          new Expanded(child:
            new Image.asset("images/ic_luntai.png",
              width: 60.0,
              height: 60.0,
            ),
            flex: 2,
          ),

          new Expanded(child:
            new Text("未登录",
              style: const TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
            ),
            flex: 7,
          ),
          new Expanded(child:
            new Image.asset("images/icon_right.png",
              width: 25.0,
              height: 25.0,
            ),
            flex: 1,
          ),

        ],
      ),
    );
  }

  List<String> mes = ["我的积分","地址管理","我的收藏","账户设置","关于我们"];

  List<Widget> _mesList(){
    List<Widget> lisW = new List();
    for (int i = 0;i<mes.length;i++){
      lisW.add(_me(mes[i]));
    }
    return lisW;
  }
  Widget _me(String item){
    return new Container(
      height: 45.0,
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: new Row(
        children: <Widget>[
          new Expanded(child:
          new Text(item,
            style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black87
            ),
          ),
            flex: 9,
          ),

          new Expanded(child:
          new Image.asset("images/icon_right.png",
            width: 25.0,
            height: 25.0,
          ),
            flex: 1,
          ),
        ],
      ),
    );
  }
  //
  Widget _imagesMe(){
    return new Row(
      children: <Widget>[
        //待付款
        new Expanded(child:
          new Column(
            children: <Widget>[
              new Image.asset("images/daifukuan.png",
                width: 35.0,
                height: 35.0,
              ),
              _conMargin(),
              new Text("待付款",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),

            ],
          ),
          flex: 1,
        ),
        //待发货
        new Expanded(child:
          new Column(
            children: <Widget>[
              new Image.asset("images/daifahuo.png",
                width: 35.0,
                height: 35.0,
              ),
              _conMargin(),
              new Text("待发货",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),

            ],
          ),
          flex: 1,
        ),
        //待收货
        new Expanded(child:
          new Column(
            children: <Widget>[
              new Image.asset("images/daishouhuo.png",
                width: 35.0,
                height: 35.0,
              ),
              _conMargin(),
              new Text("待收货",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
          flex: 1,
        ),
        //待评价
        new Expanded(child:
          new Column(
            children: <Widget>[
              new Image.asset("images/daipingjia.png",
                width: 35.0,
                height: 35.0,
              ),
              _conMargin(),
              new Text("待评价",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
          flex: 1,
        ),
        //我的订单
        new Expanded(child:
          new Column(
            children: <Widget>[
              new Image.asset("images/wdedingdan.png",
                width: 35.0,
                height: 35.0,
              ),
              _conMargin(),
              new Text("我的订单",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),

            ],
          ),
          flex: 1,
        ),
      ],
    );
  }

  //控件  间距
  _conMargin(){
    return new Container(
      margin: const EdgeInsets.only(
        top: 5.0,
      ),
    );
  }

}