import 'package:flutter/material.dart';
import 'package:flutter_app/com/activity/_LoginActivity.dart';
import 'package:flutter_app/com/activity/StartActivity.dart';
import 'package:flutter_app/com/activity/Home.dart';
import 'package:flutter_app/com/activity/ShopDetailActivity.dart';

//程序入口
void main() => runApp(
    new MyApp()
);

//void main(){
//
//  runApp(new MaterialApp(
//    home: new MyApp(),
//    routes: <String,WidgetBuilder>{
//      "/a":(BuildContext context) => new _MyPageIntent("A"),
//      "/b":(BuildContext context) => new _MyPageIntent("B")
//    },
//  ));
//}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: new MyHomePage(title: 'Flutter Demo Home Page'),
      home: new StartActivity(),
      routes: <String,WidgetBuilder>{
        "/login":(BuildContext context) => new LoginFulActivity(),
        "/home":(BuildContext context) => new HomeActivity(),
        "/shopDetail":(BuildContext context) => new ShopDetailActivity(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyCustomButton createState() => new _MyCustomButton();
}


//Intent 使用
class _MyPageIntent extends StatelessWidget{

  String tipLabel;
  BuildContext context;
  _MyPageIntent(this.tipLabel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    this.context = context;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("跳转"+tipLabel),
      ),
      body: new Center(
        child:new FloatingActionButton(
          onPressed: floatIntent,
          child: new Text("Intent"+tipLabel),
        ) ,
      ),
    );
  }

  void floatIntent(){
    //跳转
    Navigator.of(context).pushNamed('/b');
  }

}

//自定义Widgets 控件
class CustomButton extends StatelessWidget{
  final String lable;

  CustomButton(this.lable);
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    this.context = context;
    return new Center(
        widthFactor:50.0,
        heightFactor: 48.0,
        child: new RaisedButton(
            onPressed: btnIntent,
            child: new Text(lable)
        ),
    );
  }

  void btnIntent(){
    Navigator.of(context).pushNamed("/a");
  }

}
class _MyCustomButton extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Navigator.of(context).pushNamed('/a');
    return new CustomButton("this button label");
  }
}

//动画 实例
class _MyFadeTest extends State<MyHomePage> with TickerProviderStateMixin {

  AnimationController animationController;
  CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    animationController = new AnimationController(duration:const Duration(microseconds: 5000),vsync: this);
    curve = new CurvedAnimation(parent: animationController, curve: Curves.elasticIn);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("测试动画",textDirection: TextDirection.rtl,),
      ),
      body: new Center(
        child: new Container(
          child: new FadeTransition(opacity: curve,
          child: new FlutterLogo(
            size: 100.0,
          ),),
        ),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: (){
        animationController.forward();
      },
        tooltip: 'Fade',
        child: new Text("点击",textDirection: TextDirection.ltr,),
      ),
    );
  }

}


class _XMlApp extends State<MyHomePage>{

  bool flag = false;

  void _tog(){
    setState(() {
      flag = !flag;
    });
  }

  //船家女控件
  _getCild(){
    if(flag){
      return new Text("创建一个新的文本",textDirection: TextDirection.ltr,);
    }else{
      return new MaterialButton(onPressed: (){},child: new Text("Toggle Two"));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("测试标题"),
      ),
      body: _getCild(),
      floatingActionButton: new FloatingActionButton(onPressed: _tog,
      tooltip: 'Updata Text',
      child: new Icon(Icons.update),),

    );
  }

}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
