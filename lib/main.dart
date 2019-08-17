import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttom Sheet avoid Keyboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ButtomSheetScreen(),
    );
  }
}


class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w700),
          ),
          TextField(
            autofocus: false,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          FlatButton(
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class ButtomSheetScreen extends StatelessWidget {
  void openBottomSheet(context) {
    showModalBottomSheet<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: <Widget>[
              AddTaskScreen(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bottom Sheet",
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              onPressed: () {
                openBottomSheet(context);
              },
            );
          },
        ),
      ),
      body: Container(),
    );
  }
}