import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MyExplicitAnimation extends StatefulWidget {
  final RiveAnimationController<dynamic>? child;

  const MyExplicitAnimation({Key? key, required this.child}) : super(key: key);

  @override
  _controller createState() => _controller();
}

class _controller extends State<MyExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late RiveAnimationController _controllerRive;
  bool showAnimation = true;

  void _togglePlay() =>
      setState(() => _controllerRive.isActive = !_controllerRive.isActive);

  bool get isPlaying => _controllerRive.isActive;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();      print('Here');
    setState(()=>showAnimation = true);
    Future.delayed(const Duration(seconds: 5),() {
      print('Here');
      setState(()=>showAnimation = false);
    });
    _controllerRive = widget.child!;

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
         // widget.child(_controllerRive),
          showAnimation ? RiveAnimation.asset(
            'assets/rive_emoji_pack.riv',
            controllers: [_controllerRive],
            alignment: Alignment.center,
            // Update the play state when the widget's initialized
            onInit: (_) => {},
          ) : Container(),
        ],
      ),
    );
  }
}
