import 'package:flutter/cupertino.dart';
import 'package:task_management/model/UserModel.dart';
import 'package:task_management/resources/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user =
      UserModel(name: '', email: '', uid: '', profilePic: '', phoneNumber: '');
  final AuthMethods _authMethods = AuthMethods();

  UserModel get getUser => _user!;
/*    User get getUser {
      return _user?.
  }*/
/*   User? get getUser {
     User? u=_user;
    if( u!=  null)
      return u;
  }*/

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
