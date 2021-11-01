import 'package:flutter/material.dart';

class two extends StatelessWidget {
  const two({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("page two"),
        ),
        body: Column(
          children: [
            Text("page tso"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("back"))
          ],
        ));
  }
}
