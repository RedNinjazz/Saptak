import 'package:flutter/material.dart';
import 'package:skyline_template_app/viewmodels/base_viewmodel.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:skyline_template_app/core/services/navigation_service.dart';
import 'package:skyline_template_app/core/utilities/route_names.dart';
import 'package:skyline_template_app/core/enums/view_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RegistrationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String _email;

  String get email => _email;
  String _password;

  String get password => _password;
  final _firebaseAuth = FirebaseAuth.instance;
  String _name;

  String get name => _name;
  FirebaseDatabase database = FirebaseDatabase.instance;

  String _experience;
  String get experience => _experience;

  Future init() async {
    print("Registration ViewModel init()");
    setState(ViewState.Busy);
    try {
      print('try registration statement');
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);
  }

  void setName(String username) async {
    _name = username;
  }

  void registerUser() async {
    try {
     _firebaseAuth.createUserWithEmailAndPassword(
          email: _email, password: _password);
     await _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password);
     String a = FirebaseAuth.instance.currentUser.uid;
      DatabaseReference ref = FirebaseDatabase.instance.ref("Students/" + a);
      await ref.set({
        ("name"): name,
        ("Skill Level"): experience,
      });
    } catch (e) {
      print("Failed to register User: $e");
      return;
    }
    routeToHomeView();
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      );

  void setEmailAddress(String inputString) {
    _email = inputString;
  }
  void setExperience(String inputString) {
    _experience = inputString;
  }

  void setPassword(String inputString) {
    _password = inputString;
  }

  void routeToTeacherView() {
    _navigationService.navigateTo(TeacherViewRoute);
  }

  void routeToHomeView() {
    _navigationService.navigateTo(HomeViewRoute);
  }

  void routeToLoginView() {
    _navigationService.navigateTo(LoginViewRoute);
  }



  RegistrationViewModel() {
    setState(ViewState.Busy);
    try {
      print("RegistrationViewModel Constructor Called()");
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);
  }
}


