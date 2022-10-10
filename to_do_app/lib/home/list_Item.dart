import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:to_do_app/domain/card_to_do.dart';

import 'animation.dart';

class ListItem extends StatefulWidget {
  CardToDo element;
  final Function(bool?) onChanged;
  final Function() viewDetail;

  ListItem(
      {Key? key,
      required this.element,
      required this.onChanged,
      required this.viewDetail})
      : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final _biggerFont = const TextStyle(fontSize: 18);

  late final RiveAnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = SimpleAnimation('idle')..isActive = false;
  }

  @override
  Widget build(BuildContext context) => Material(
        child: GestureDetector(
          onTap: widget.viewDetail,
          child: Stack(
            children: [
              ListTile(
                title: Text(
                  widget.element.title,
                  style: _biggerFont,
                ),
                subtitle: Text(widget.element.description),
                trailing: Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.pinkAccent,
                    value: widget.element.done,
                    onChanged: (done) {
                      controller.isActive = done ?? false;
                      widget.onChanged(done);
                    }),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: controller.isActive
                      ? MyExplicitAnimation(child: controller)
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      );
}
