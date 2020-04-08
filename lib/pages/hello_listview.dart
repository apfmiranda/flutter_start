import 'package:flutter/material.dart';
import 'package:flutter_app/pages/dog_page.dart';
import 'package:flutter_app/utils/nav.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {

  bool gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list),onPressed: () {
            print("list");
            setState(() {
              gridView = false;
            });
          },),
          IconButton(icon: Icon(Icons.grid_on),onPressed: () {
            print("grid");
            setState(() {
              gridView = true;
            });
          },)
        ],
      ),
      body: _body(context),
    );
  }

  _body(context) {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];

    if (this.gridView) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }


  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];
    
    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              dog.nome,
              style: TextStyle(color: Colors.white, fontSize: 26, shadows: [
                Shadow(
                    offset: Offset(3.0, 1.0),
                    blurRadius: 6.0,
                    color: Colors.black)
              ]),
            ),
          )
        ],
      ),
    );
  }

  _img(String img) {
    return Image.asset(img, fit: BoxFit.cover);
  }
}
