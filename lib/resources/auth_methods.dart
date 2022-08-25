import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management/model/UserModel.dart';
import 'package:task_management/provider/user_provider.dart';
import 'package:task_management/resources/storage_methods.dart';
import 'package:provider/provider.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromJson(snap.data() as Map<String, dynamic>);
  }

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  }) async {
    String res = "Some error occurred";
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      print(cred.user!.uid);
      UserModel user = UserModel(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePic: '',
          phoneNumber: phoneNumber);

      await _firestore
          .collection('users')
          .doc(cred.user!.uid)
          .set(user.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occurred";
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser!.reload();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> resetPassword({
    required String email,
  }) async {
    String res = "some error occurred";
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> updateProfilePic({
    required Uint8List file,
    required BuildContext context,
  }) async {
    String res = "some error occurred";
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage(file);
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({'profilePic': photoUrl});
      UserProvider _userProvider = Provider.of(context, listen: false);
      await _userProvider.refreshUser();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> updateUsername({
    required String username,
    required BuildContext context,
  }) async {
    String res = "some error occurred";
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({'name': username});
      UserProvider _userProvider = Provider.of(context, listen: false);
      await _userProvider.refreshUser();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//   Future<String> ChangePassword({
//  required String email,
//  required   String oldPass,
//  required   String newPass,
// }) async{
//     final user = FirebaseAuth.instance.currentUser;
//     AuthCredential credential = EmailAuthProvider.credential(email: email,password: oldPass);
//
//     user?.reauthenticate(credential).addOnCompleteListener(new OnCompleteListener<Void>() {
//     @Override
//     public void onComplete(@NonNull Task<Void> task) {
//     if(task.isSuccessful()){
//     user.updatePassword(newPass).addOnCompleteListener(new OnCompleteListener<Void>() {
//     @Override
//     public void onComplete(@NonNull Task<Void> task) {
//     if(!task.isSuccessful()){
//     Snackbar snackbar_fail = Snackbar
//         .make(coordinatorLayout, "Something went wrong. Please try again later", Snackbar.LENGTH_LONG);
//     snackbar_fail.show();
//     }else {
//     Snackbar snackbar_su = Snackbar
//         .make(coordinatorLayout, "Password Successfully Modified", Snackbar.LENGTH_LONG);
//     snackbar_su.show();
//     }
//     }
//     });
//     }else {
//     Snackbar snackbar_su = Snackbar
//         .make(coordinatorLayout, "Authentication Failed", Snackbar.LENGTH_LONG);
//     snackbar_su.show();
//     }
//     }
//     });
//   }
// }
// }
  Future<String> changePassword(
      String currentPassword, String newPassword) async {
    String res = 'Some Error Occurred';

    //Create an instance of the current user.
    var user = await FirebaseAuth.instance.currentUser!;
    //Must re-authenticate user before updating the password. Otherwise it may fail or user get signed out.

    final cred = await EmailAuthProvider.credential(
        email: user.email!, password: currentPassword);
    await user.reauthenticateWithCredential(cred).then((value) async {
      await user.updatePassword(newPassword).then((_) {
        res = 'success';
        //usersRef.doc(uid).update({"password": newPassword});
      }).catchError((error) {
        res = error.toString();
      });
    }).catchError((err) {
      res = err.toString();
    });

    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  String getUid() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    print(uid);
    return uid;
  }
}
