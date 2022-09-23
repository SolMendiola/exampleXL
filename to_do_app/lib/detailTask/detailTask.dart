import 'package:auto_route/auto_route.dart';
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
          onPressed: context.router.pop,
          child: Text(
            'Todos',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        width: 375,
        height: 262,
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Not done', style: TextStyle(color: Colors.pinkAccent)),
            Text('Two-line item',
                style: TextStyle(color: Colors.black, fontSize: 34)),
            Text('Recently i came across an ....'),
            TextButton(
              onPressed: null,
              child: Text(
                'MARK AS DONE',
                style: TextStyle(color: Colors.pinkAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
