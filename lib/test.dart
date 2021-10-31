import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  TextEditingController username = new TextEditingController();
  String val = "";
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    send() {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        print("valid");
      } else
        print("not valid");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Form(
        key: formstate,
        child: Column(
          children: [
            TextFormField(validator: (text) {
              if (text!.length < 4) {
                return "error";
              }
              return null;
            }),
            ElevatedButton(onPressed: send, child: Text("send data")),
          ],
        ),
      ),
    );
  }
}
