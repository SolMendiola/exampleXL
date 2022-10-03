import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatefulWidget {
  ProgressWidget({Key? key, this.totalValue, this.currentValue})
      : super(key: key);

  final totalValue;
  var currentValue;

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Container(
          height: 20,
          width: size,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                width: widget.currentValue / widget.totalValue * size,
                duration: const Duration(milliseconds: 500),
                child: Container(

                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
