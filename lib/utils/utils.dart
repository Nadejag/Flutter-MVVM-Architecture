import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class utils{
 static toastMessage(String message){
   Fluttertoast.showToast(msg: message,
     backgroundColor: Colors.red,textColor: Colors.green,
   toastLength: Toast.LENGTH_SHORT
   );
  }

  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode NextFocus
      ){
       current.unfocus();
       FocusScope.of(context).requestFocus(NextFocus);
  }

  static void flushBarErrorMessage(String message,BuildContext context){
   showFlushbar(context: context,
       flushbar: Flushbar(
       forwardAnimationCurve: Curves.decelerate,
           margin: EdgeInsets.symmetric(horizontal: 20,vertical:20),
         padding:EdgeInsets.all(20) ,
         message: message,
         duration: Duration(seconds: 3),
          // flushbarPosition: FlushbarPosition.TOP,
         backgroundColor: Colors.red,
         reverseAnimationCurve: Curves.easeInOut,
         positionOffset: 20,
         borderRadius: BorderRadius.circular(5),
         icon: Icon(Icons.error,size: 28,color: Colors.white,),
       )..show(context)
   );
  }
  static snackBar(String message,BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
         backgroundColor: Colors.red,
         content: Text(message))
   );
  }
}