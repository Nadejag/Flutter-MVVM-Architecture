 import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/semantics.dart';
import 'package:mvvm_architecture/repository/auth_repository.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo=AuthRepository();

  bool _loading=false;
  bool get loading => _loading;

  setLoadin(bool value){
    _loading=value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data,BuildContext context) async{
setLoadin(true);
      _myRepo.loginApi(data).then((value){
        setLoadin(false);
        utils.flushBarErrorMessage('Login SuccesFully', context);
       Navigator.pushNamed(context,RoutesNames.home);
        if(kDebugMode){
         print(value.toString());
       }
      }).onError((error,stackTrace){
        setLoadin(false);
        utils.flushBarErrorMessage(error.toString(), context);
        if(kDebugMode){
          print(error.toString());
        }
      });
  }
}