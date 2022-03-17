import 'package:skyline_template_app/viewmodels/base_viewmodel.dart';
import 'package:skyline_template_app/core/enums/view_state.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:skyline_template_app/core/services/navigation_service.dart';
import 'package:skyline_template_app/core/utilities/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String _email;
  String get email => _email;
  String _password;
  String get password => _password;
  final _firebaseAuth = FirebaseAuth.instance;

  FirebaseDatabase database = FirebaseDatabase.instance;
  
  Future init() async {
    print("Login ViewModel init()");
    setState(ViewState.Busy);
    try {
      print('try login statement');
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);

  }
  void loginUser() async{
    try
    {
      await _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password);
    }
    catch(e)
    {
      print("Failed to sign in user: $e");
      return;
    }
    String a = FirebaseAuth.instance.currentUser.uid;
    if(a == "zingTbPxP7fgU8SccqSbsBQn4sZ2") {
      routeToHomeView();
    }
    else{
      routeToTeacherView();
    }
  }
  void setEmailAddress(String inputString) {
    _email = inputString;
  }

  void setPassword(String inputString) {
    _password = inputString;
  }

  void routeToRegistrationView()
  {
    _navigationService.navigateTo(RegistrationViewRoute);
  }


  void routeToTeacherView() {
    _navigationService.navigateTo(TeacherViewRoute);
  }

  void routeToHomeView() {
    _navigationService.navigateTo(HomeViewRoute);
  }


}
