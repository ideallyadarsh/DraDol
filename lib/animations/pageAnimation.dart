import 'package:flutter/cupertino.dart';

class pageAnimation extends PageRouteBuilder{
  final Widget pageName;
  pageAnimation({this.pageName}) : super(
    transitionDuration:Duration(milliseconds:500 ),
    transitionsBuilder:(BuildContext context,
    Animation<double> animation,
    Animation<double> secAnimation,
    Widget child){
   animation =CurvedAnimation(parent: animation,curve: Curves.fastLinearToSlowEaseIn);
   return ScaleTransition(
     alignment: Alignment.center,
     scale: animation,
     child: child,
   );
    },
    pageBuilder:(BuildContext context,Animation<double> animation,Animation<double> secAnimation){
      return pageName;
    });
}