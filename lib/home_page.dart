import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/drawer_list.dart';
import 'package:flutter_app/pages/hello_listview.dart';
import 'package:flutter_app/pages/hello_page2.dart';
import 'package:flutter_app/pages/hello_page3.dart';
import 'package:flutter_app/utils/nav.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Olá Flutter"),
          bottom: TabBar(tabs: [
            Tab(text: "TAB 1",),
            Tab(text: "TAB 2",),
            Tab(text: "TAB 3",),
          ]),
        ),
        body: TabBarView(children: [
          _body(),
          Container(
           color: Colors.yellow,
          ),
          Container(
            color: Colors.red,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            _onClickFab();
        }),
        drawer: DrawerList(),
      ),
    );
  }

  _onClickFab() {
    print("FAB");
  }


  _body() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(builder: (context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("ListView", onPressed: () => _onClickNavigator(context, HelloListView())),
              BlueButton("Page 2", onPressed: () => _onClickNavigator(context, HelloPage2())),
              BlueButton("Page 3", onPressed: () => _onClickNavigator(context, HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("Snack", onPressed: () => _onClickSnack(context)),
              BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
              BlueButton("Toast", onPressed: () => _onClickToast())
            ],
          )
        ],
      );
    });
  }


  void _onClickNavigator(BuildContext context, Widget page) async {
    push(context, page);
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá flutter"),
      action: SnackBarAction(label: "OK", onPressed: (){
        print("ok");
      }),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Muito legal"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                  print("OK!!!");
                },
              )
            ],
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,

    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover
    );
  }

  _text() {
    return Text(" Bernardo", style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
        decoration: TextDecoration.underline),
    );
  }




}