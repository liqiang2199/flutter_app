import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
/**
 * 管理 返回的 通用 布局
 * 如 商品列表
 *
 */
class ViewUtils{
  //返回商品列表
  Widget shopListView(double w){
    return new Container(
      width: w,
      margin: new EdgeInsets.only(
        left: 10.0,
        top: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              //图片
              new Image.asset("images/ic_luntai.png",
                width: 80.0,
                height: 60.0,
              ),
              //商品名称  规格  价格
              new Column(
                children: <Widget>[
                  new Text("和平261",
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                  new Text("大小_12R22.5",
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  new Container(
                    margin: const EdgeInsets.only(
                      top: 25.0,
                    ),
                  ),

                  new Text("￥13333.0",
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.left,
                  ),

                ],
              ),

            ],
          ),
          //分割线
          new Container(
            width: window.physicalSize.width,
            height: 1.0,
            color: Colors.grey,
          )

        ],
      ),

    );
  }

}