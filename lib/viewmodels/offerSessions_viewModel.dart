import 'package:flutter/material.dart';
import 'package:skyline_template_app/viewmodels/base_viewmodel.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:skyline_template_app/core/services/navigation_service.dart';
import 'package:skyline_template_app/core/utilities/route_names.dart';
import 'package:skyline_template_app/core/enums/view_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class OfferSessionsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String _date;

  String get date => _date;
  String _time;

  String get time => _time;


  String _experience;
  String get experience => _experience;

  FirebaseDatabase database = FirebaseDatabase.instance;

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


  void setTime(String username) async {
    _time = username;
  }

  void offerSessions() async {
      DatabaseReference ref = FirebaseDatabase.instance.ref("Sessions/" + date);
      await ref.set({
        ("Time"): time,
        ("Skill Level"): experience,
      });
  }

  void setDate(String inputString) {
    _date = inputString;
  }
  void setExperience(String inputString) {
    _experience = inputString;
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



  OfferSessionsViewModel() {
    setState(ViewState.Busy);
    try {
      print("OfferSessionsViewModel Constructor Called()");
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);
  }
}


