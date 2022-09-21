
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailOfTask extends StatelessWidget {
  const DetailOfTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detail', textAlign: TextAlign.center),
          leading: TextButton(
              onPressed: Navigator.of(context).pop,
              child:
              Text('Todos', style: TextStyle(color: Colors.white)))),
      body: Container(
        width: 375,
        height: 262,
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(''),
            Text('Two-line item',
                style: TextStyle(color: Colors.black, fontSize: 34)),
            Text('Recently i came across an ....')
          ],
        ),
      ),
    );
  }
}
