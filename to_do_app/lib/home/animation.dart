import 'package:flutter/material.dart';

class MyExplicitAnimation extends StatefulWidget {
  final Widget Function(AnimationController) child;

  const MyExplicitAnimation({Key? key, required this.child}) : super(key: key);

  @override
  _MyExplicitAnimationState createState() => _MyExplicitAnimationState();
}

class _MyExplicitAnimationState extends State<MyExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animationController.addStatusListener((animationStatus) {
      if(animationStatus == AnimationStatus.completed){
        _animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Center(
            child: Stack(
          children: [
            child!,
            const SizedBox(
              height: 20,
            ),
            if (_animationController.isAnimating)
              Transform.scale(
                scale: _animationController.value,
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/party.png', height: 100, width: 100),
                ),
              ),
          ],
        ));
      },
      child: widget.child(_animationController),
    );
  }
}
