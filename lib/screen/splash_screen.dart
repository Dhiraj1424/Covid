import 'dart:async';

import 'package:covid_app/screen/countery.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

 late final AnimationController _controller=AnimationController(
  duration:const Duration(seconds: 10),
  vsync: this)..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

Timer(Duration(seconds: 3),
 ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Country()
 )));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
AnimatedBuilder (animation:_controller ,
 builder: ((context, child) {
  return Transform.rotate(angle: _controller.value*2.0 *math.pi,
  child:child ,
  );
}),
// child: Container(
// width: 100,
// height:  100,
// child: Center(
//   child: Image(image: AssetImage('images/covid.png')),
// )
// ),
child: Center(
  child:   Container(
  
    width: 100,
  
    height: 100,
  
    child:const Center(
  
      child: Image(image:  AssetImage('images/covid.png')),
  
    ),
  
  ),
),
),
SizedBox(
  height: MediaQuery.of(context).size.height*0.08,
),
 const Align(
  alignment: Alignment.center,
   child: Text(
    'Covid 19 App',style: TextStyle(fontWeight: FontWeight.bold),
 ),
 )

          ],
        ),
      ),
    );
  }
}