import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(title: 'Fruit Selector'),
    );
  }
}

class HomeView extends StatefulWidget {
  final String title;
  HomeView({required this.title});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final myController = TextEditingController();
  int _enter = 0;
  var fruitlist = ['apple', 'orange', 'rabutan'];
  String answer = '';
  void change() {
    setState(() {
      _enter = int.parse(myController.text);
      _enter = _enter - 1;
      answer = fruitlist[_enter];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: change,
            child: Icon(Icons.ac_unit),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: myController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              Text(
                '$answer',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.amber,
                    fontSize: 50),
              )
            ],
          ),
        ),
      ),
    );
  }
}
