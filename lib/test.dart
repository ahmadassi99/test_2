import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_2/one.dart';
import 'package:test_2/two.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  TextEditingController username = new TextEditingController();
  var usernam = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    send() {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        formdata.save();
        print("username:$usernam");
        print("password:$password");
      } else
        print("not valid");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("hamzeh"),
      ),
      body: Form(
        key: formstate,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(onSaved: (text) {
              usernam = text!;
            }, validator: (text) {
              if (text!.length < 4) {
                return "ahmsss";
              }
              if (text == "ahmad") {
                return "perfect input";
              }
              return null;
            }),
            TextFormField(
              onSaved: (text) {
                password = text!;
              },
              validator: (text) {
                if (text!.length < 4) {
                  return "ahmsss";
                }
                if (text == "ahmad") {
                  return "perfect input";
                }
                return null;
              },
              obscureText: true,
            ),
            ElevatedButton(onPressed: send, child: Text("send data")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return one();
                  }));
                },
                child: Text("go to page one")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return two();
                  }));
                },
                child: Text("go to page two"))
          ],
        ),
      ),
    );
  }
}
