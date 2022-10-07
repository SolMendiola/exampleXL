import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MyExplicitAnimation extends StatefulWidget {
  final Widget Function(RiveAnimationController) child;

  const MyExplicitAnimation({Key? key, required this.child}) : super(key: key);

  @override
  _controller createState() => _controller();
}

class _controller extends State<MyExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late RiveAnimationController _controllerRive;

  void _togglePlay() =>
      setState(() => _controllerRive.isActive = !_controllerRive.isActive);

  bool get isPlaying => _controllerRive.isActive;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerRive = SimpleAnimation('idle');

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          widget.child(_controllerRive),
          if(_controllerRive.isActive)
          RiveAnimation.asset(
            'assets/party.riv',
            controllers: [_controllerRive],
            alignment: Alignment.center,
            // Update the play state when the widget's initialized
            onInit: (_) => {},
          ),
        ],
      ),
    );
  }
}
