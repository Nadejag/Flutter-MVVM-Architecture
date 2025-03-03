import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class RoundButton extends StatelessWidget{

   final String title;
   final bool loading;
   final VoidCallback onPress;

   const RoundButton({Key? key,
  required this.title,
    this.loading=false,
    required this.onPress,
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap: onPress,
     child: Container(
       height: 40,
       decoration: BoxDecoration(
        color:AppColors.buttoncolor,
             borderRadius: BorderRadius.circular(5)
       ),
       width: 200,
       child: Center(child:loading? CircularProgressIndicator(color: Colors.white,): Text("Login",style: TextStyle(color: Colors.white,fontSize: 20),)),
     ),
   );
  }

}