//  =======================================================
//      Fichier gérant l'user
//  =======================================================
// Flutter Imports
import 'package:flutter/material.dart';

import 'package:social667/models/user.dart';

class UserProvider extends ChangeNotifier {
  // Index par défaut
  User user = User(name: '', email: '', password: '', photo: "");

  User get getUser {
    return user;
  }

 

  void updateUser(User newUser) {
    user = newUser;
    notifyListeners();
  }
}
