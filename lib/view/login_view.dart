import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/ViewModel/auth_view_model.dart';
import 'package:mvvm_architecture/res/Components/round_button.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
 ValueNotifier<bool> _obsecurePassword=ValueNotifier<bool>(true);
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();
@override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
  final authViewMode=Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login\\SignUp',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)
                ),
                onFieldSubmitted: (value){
                    utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                  },
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword, builder:(context,value,child){
                return  TextFormField(
                  controller: _passwordController,
                  obscureText: _obsecurePassword.value,
                  obscuringCharacter: '*',
                  focusNode: passwordFocusNode,
                  decoration:  InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      suffixIcon: InkWell(
                          onTap: (){
                            _obsecurePassword.value=!_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value? Icons.visibility_off_outlined :Icons.visibility))
                  ),
                );
              }),
              SizedBox(height: height*0.06,),
              RoundButton(
                title: 'login',
                loading: authViewMode.loading,
                onPress: (){
                 if(_emailController.text.isEmpty){
                 utils.flushBarErrorMessage("Please enter email", context);
                 }
                 else if(_passwordController.text.isEmpty){
                   utils.flushBarErrorMessage("Please enter Password", context);
                 }
                 else if(_passwordController.text.length < 6 ){
                   utils.flushBarErrorMessage("Please enter 6 digits password", context);
                 }
                 else{
                   Map data={
                     'email':_emailController.text.toString(),
                     'password':_passwordController.text.toString()
                   };
                   authViewMode.loginApi(data,context);
                   print("Api hit");
                 }
                },
              )
            ],
          ) ),

    );
  }
}
