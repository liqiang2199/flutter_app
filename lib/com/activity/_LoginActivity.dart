import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';

class LoginFulActivity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new LoginActivity();
  }

}

//登陆界面
class LoginActivity extends State<LoginFulActivity>{

  TextEditingController _editCon = new TextEditingController();
  String _phoneNum = "";
  String _passwordNum = "";

  Widget _editPassWord(BuildContext context){
    var node = new FocusNode();
    return new Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new TextField(
        onChanged: (str) {
          _passwordNum = str;
          setState(() {});

        },
        decoration: new InputDecoration(
          hintText: '请输入密码',
        ),
        maxLines: 1,
        maxLength: 20,
        //键盘展示为号码
        keyboardType: TextInputType.text,
        //只能输入数字
        onSubmitted: (text) {
          FocusScope.of(context).reparentIfNeeded(node);
        },
      ),
    );
  }


  Widget _buildPhoneEdit(BuildContext context) {
    var node = new FocusNode();
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
      child: new TextField(
        onChanged: (str) {
          _phoneNum = str;
          setState(() {});
        },
        decoration: new InputDecoration(
          hintText: '请输入手机号',
        ),
        maxLines: 1,
        maxLength: 11,
        //键盘展示为号码
        keyboardType: TextInputType.phone,
        //只能输入数字
//        inputFormatters: <TextInputFormatter>[
//          WhitelistingTextInputFormatter.digitsOnly,
//        ],
        onSubmitted: (text) {
          FocusScope.of(context).reparentIfNeeded(node);
        },
      ),
    );
  }
  //上边距
  Widget _marginContain(top){
    return new Container(
      margin: new EdgeInsets.only(
        top: top,
      ),
    );
  }

  //创建登陆button
  Widget _buildLoginButton(BuildContext context){

    return new Row(
      children: <Widget>[
        new Expanded(child:

        new Padding(padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
          child: new RaisedButton(onPressed: (_phoneNum.isEmpty||_passwordNum.isEmpty)? null :(){
            _loginBtn();

//            showDialog(context: context,
//                child: new AlertDialog(
//                  title: new Text("登陆"),
//                  content: new Text(_phoneNum+_passwordNum),
//                )
//            );
          },
            color: Colors.green,
            textColor: Colors.white,
            disabledColor: Colors.green[100],
            child: new Text("登 陆",
              style: new  TextStyle(fontSize: 16.0,),
            ),

          ),
        ),

        ),

      ],
    );
  }
  //登陆按钮点击
  void _loginBtn(){
    //跳转首页
    //loadHttpLogin();
    Navigator.of(context).pushNamed('/home');
  }

  //登陆接口请求
  void loadHttpLogin() async {
    String dataUrl = "http://47.100.197.49:8080/nb2b-mall/v1/loginWeb";
    //String dataUrl = "https://jsonplaceholder.typicode.com/posts";


    http.Response response = await http.post(dataUrl,
        //设置请求头
        headers: {"Accept": "application/json"},
        //请求参数
        body: {"loginAccount":"18081268217",
                "loginPsd":"123456",
                "type":"1","code":"",}
    );

    //请求
    setState(() {
      //List data = JSON.decode(response.body);
      print(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Material(
      child: new Column(//列
        children: <Widget>[
          _marginContain(80.0),
          //登陆  和图标显示
          new Row( //行
            children: <Widget>[

              new Padding(padding: new EdgeInsets.only(
                  left: 20.0,
                  top: 20.0,
                  bottom: 0.0
              )),
              new Text("登陆",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                textScaleFactor: 1.7,
                style: new TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),

              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new Image.asset("images/login_free.png",scale: 2.0,)
            ],
          ),

          //欢迎来到汽车管家
          new Row(
            children: <Widget>[
              new Padding(padding: new EdgeInsets.only(
                left: 20.0,
                top: 5.0,
              ),
                child: new Text("欢迎来到汽车管家",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,

                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),

            ],

          ),

          _marginContain(50.0),

          //账号输入

          _buildPhoneEdit(context),
          _editPassWord(context),

          //登陆按钮
          _buildLoginButton(context),


        ],
      ),
    );


  }

}