//text_plugin
import 'dart:ui';
import 'dart:async';
import 'package:flutter/services.dart';

/**
 * 这个文件才是相当于一个桥梁，连接着我们的Android代码，也提供了供flutter代码调用的方法
 */
class TextPlugin{
  static const MethodChannel _channel = const MethodChannel("text_plugin");

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  //声明plugin加载的方法，参数为url，callback回调，和可选参数Rect（控制）plugin的大小
  Future<Null> launch(
      String url,
      Function callback, {
        Rect rect,
      }) async {
    Map<String, dynamic> args = {
      "textValue": url,
    };
    if (rect != null) {
      args["rect"] = {
        "left": rect.left,
        "top": rect.top ,
        "width": rect.width,
        "height": rect.height
      };
    }
    //用定义好的插件 传入数据
    final String result = await _channel.invokeMethod('load', args);

    if (callback != null) {
      //回传数据
      callback(result);
    }
  }

}