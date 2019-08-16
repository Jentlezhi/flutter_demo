import 'package:flutter/material.dart';

class AnimatinoDemo extends StatefulWidget {
  @override
  _AnimatinoDemoState createState() => new _AnimatinoDemoState();
}

class _AnimatinoDemoState extends State<AnimatinoDemo>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  Animation _colorAnimation;
  CurvedAnimation _curve;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      // value: 32.0,
      // lowerBound: 32,
      // upperBound: 100,
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _curve = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
    _animation = Tween(begin: 32.0, end: 100.0).animate(_curve);
    _colorAnimation =
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(_curve);
    _animationController.addListener(() {
      print("${_animationController.value}");
      setState(() {});
    });

    ///开始播放动画
    // _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Animation'),
    //   ),
    //   body: Center(
    //     child: IconButton(
    //       icon: Icon(Icons.favorite),
    //       // iconSize: _animationController.value,
    //       iconSize: _animation.value,
    //       color: _colorAnimation.value,
    //       onPressed: () {
    //         if (_animationController.status == AnimationStatus.completed) {
    //           _animationController.reverse();
    //         } else {
    //           _animationController.forward();
    //         }
    //       },
    //     ),
    //   ),
    // );
    return AnimatedHeart(
      animations: [_animation, _colorAnimation],
      animationController: _animationController,
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  String _msg = '';
  final List animations;
  final AnimationController animationController;
  AnimatedHeart({
    this.animations,
    this.animationController,
  }) : super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              // iconSize: _animationController.value,
              iconSize: animations[0].value,
              color: animations[1].value,
              onPressed: () {
                if (animationController.status == AnimationStatus.completed) {
                  animationController.reverse();
                } else {
                  animationController.forward();
                }
              },
            ),
            Text('$_msg'),
          ],
        ),
      ),
    );
  }
}
