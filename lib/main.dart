import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    showToast() {
      setState(() {
        Fluttertoast.showToast(
            msg: "This is notification from toast",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.pink.shade200);
      });
    }
    void showAlert(BuildContext context){
      setState(() {
        Widget buttonOk = MaterialButton(
          child: const Text("OK"),
          onPressed: (){
            Navigator.of(context).pop();
        });

        AlertDialog alert = AlertDialog(
          title: const Text("Simple Alert"),
          content: const Text("Notification from Alert"),
          actions: [
            buttonOk,
          ],
        );
        showDialog(context: context, builder: (BuildContext contex) {
          return alert;
        });
      });
    }

    return MaterialApp(
      home: Scaffold(
        // key: _scafoldkey,
        appBar: AppBar(
          title: const Text("Latihan Notification"),
        ),
        body: Center(
          child: Builder(
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    showToast();
                  },
                  child: const Text("Show Toast"),
                ),
                const SnackBarPage(),
                ElevatedButton(onPressed: (){showAlert(context);}, child: const Text("Show Alert"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}