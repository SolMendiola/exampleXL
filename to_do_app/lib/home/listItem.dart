import 'package:flutter/material.dart';
import 'package:to_do_app/domain/card_to_do.dart';

class ListItem extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18);
  final CardToDo element;
  void Function(bool?) onChanged;
  void Function() viewDetail;

  ListItem(
      {Key? key,
      required this.element,
      required this.onChanged,
      required this.viewDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: viewDetail,
        child: ListTile(
          title: Text(
            element.title,
            style: _biggerFont,
          ),
          subtitle: Text(element.description),
          trailing: Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.pinkAccent,
              value: element.done,
              onChanged: onChanged),
        ),
      );
}
