import 'package:cdd_mobile_frontend/view/page/user/edit_user_page.dart';
import 'package:cdd_mobile_frontend/view/page/user/system_setting_page.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'about_us_page.dart';
import 'help_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(123, 104, 238, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyRowFirst(),
            MyRowSecond(),
            MyContainer(),
            MyRowThird(),
          ],
        ),
      ),
    );
  }
}

class MyRowFirst extends StatelessWidget {
  const MyRowFirst({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, userVM, child) {
        return Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 0.0, left: 20.0),
              width: 100.0,
              height: 100.0,
              //color: Colors.lightGreenAccent,
              child: ClipOval(
                child: Image.network(userVM.user.avatar),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 20.0, left: 0.0, right: 0.0),
                  padding: EdgeInsets.all(0.0),
                  height: 50.0,
                  child: new Text(userVM.user.nickName,
                      style: new TextStyle(color: Colors.black),
                      textAlign: TextAlign.start),
                  alignment: Alignment.topLeft,
                ),
                new Container(
                  margin: EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
                  padding: EdgeInsets.all(0.0),
                  height: 50.0,
                  child: new Text(userVM.user.introduction,
                      style: new TextStyle(color: Colors.black),
                      textAlign: TextAlign.start),
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

//四个分区栏
class MyRowSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Expanded(
          flex: 1,
          child: new MyPet(),
        ),
        new Expanded(
          flex: 1,
          child: new MyAction(),
        ),
        new Expanded(
          flex: 1,
          child: new MyFork(),
        ),
        new Expanded(
          flex: 1,
          child: new MyFans(),
        ),
      ],
    );
  }
}

//退出登陆
class MyRowThird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(
            top: 60.0,
          ),
          //color: Colors.lime,
          child: new RaisedButton(
            onPressed: () {},
            color: Colors.lightBlue,
            child: new Text('退出登陆'),
          ),
        ),
      ],
    );
  }
}

//中间四个列
class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new MyEdit(),
          new MySetting(),
          new MyHelp(),
          new MyMessage(),
        ],
      ),
    );
  }
}

class MyEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new Edituser()));
      },
      child: new Container(
        //child: new Expanded(
        child: new Text(
          '编辑个人资料',
          style: new TextStyle(color: Colors.black87),
        ),
        //),
        padding: EdgeInsets.all(0.0),
        height: 50.0,
        margin: EdgeInsets.only(left: 30),
      ),
    );
  }
}

//系统设置
class MySetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) => new Systemsetting()));
      },
      child: new Container(
        //child: new Expanded(
        child: new Text(
          '系统设置',
          style: new TextStyle(color: Colors.black87),
        ),
        //),
        padding: EdgeInsets.all(0.0),
        height: 50.0,
        margin: EdgeInsets.only(left: 30),
      ),
    );
  }
}

//帮助
class MyHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => new Help()));
      },
      child: new Container(
        //child: new Expanded(
        child: new Text(
          '帮助',
          style: new TextStyle(color: Colors.black87),
        ),
        //),
        padding: EdgeInsets.all(0.0),
        height: 50.0,
        margin: EdgeInsets.only(left: 30),
      ),
    );
  }
}

//关于我们
class MyMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new Aboutus()));
      },
      child: new Container(
        //child: new Expanded(
        child: new Text(
          '关于我们',
          style: new TextStyle(color: Colors.black87),
        ),
        //),
        padding: EdgeInsets.all(0.0),
        height: 50.0,
        margin: EdgeInsets.only(left: 30),
      ),
    );
  }
}

//宠物
class MyPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {},
      child: new Container(
        margin: EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
        padding: EdgeInsets.all(0.0),
        height: 70.0,
        //color: Colors.deepPurpleAccent,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Text('宠物'),
            ),
            Consumer<UserViewModel>(
              builder: (context, userVM, child) {
                return new Expanded(
                  child: new Text('${userVM.user.petNumber}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//动态
class MyAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {},
      child: new Container(
        margin: EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
        padding: EdgeInsets.all(0.0),
        height: 70.0,
        //color: Colors.white,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Text('动态'),
            ),
            new Expanded(
              child: new Text('00'),
            ),
          ],
        ),
      ),
    );
  }
}

//关注
class MyFork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {},
      child: new Container(
        margin: EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
        padding: EdgeInsets.all(0.0),
        height: 70.0,
        //color: Colors.black87,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Text('关注'),
            ),
            new Expanded(
              child: new Text('00'),
            ),
          ],
        ),
      ),
    );
  }
}

//粉丝
class MyFans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {},
      child: new Container(
        margin: EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
        padding: EdgeInsets.all(0.0),
        height: 70.0,
        //color: Colors.limeAccent,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Text('粉丝'),
            ),
            new Expanded(
              child: new Text('00'),
            ),
          ],
        ),
      ),
    );
  }
}
