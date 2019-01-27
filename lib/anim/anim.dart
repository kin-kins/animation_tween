import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  int _counter=0;
  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(seconds:3 ));
    super.initState();
    animation= new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.addListener((){
      this.setState((){
        _counter++;

      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Center(
        child:  Text(
    _controller.isAnimating?(_counter.toStringAsFixed(2)):"Let's Begin",
          style: new TextStyle(fontSize: 24.0*_controller.value+10),
      ),
    ),
      onTap: ()
        {
        _controller.forward(from: 0.0);
        },

    );
  }
}
