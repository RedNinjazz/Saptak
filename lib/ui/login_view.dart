import 'package:flutter/material.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:skyline_template_app/viewmodels/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<LoginViewModel>(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => Scaffold(
            backgroundColor: Colors.yellowAccent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 140.0,
                  ),
                  Container(
                    child: Center(child: Text("Saptak",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.cyan),)),
                  ),SizedBox(height: 10,),
                  Container(child: Image.asset('assets/microphone.png',height: 100, width: 100,),),
                  SizedBox(
                    height: 18.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        //Do something with the user input.
                        viewModel.setEmailAddress(value);
                      },
                      decoration: InputDecoration(filled: true,fillColor: kColorSkylineWhite,
                        hintText: 'Enter your email',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: kColorSkyLineGrey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: kColorSkyLineGrey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      onChanged: (value) {
                        //Do something with the user input.
                        viewModel.setPassword(value);
                      },
                      decoration: InputDecoration(filled: true,fillColor: kColorSkylineWhite,
                        hintText: 'Enter your password.',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: kColorSkyLineGrey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: kColorSkyLineGrey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                 SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    child: Material(
                      color: kColorSkyLineGrey,
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          //Implement login functionality.
                          viewModel.loginUser();
                        },
                        minWidth: 330.0,
                        height: 42.0,
                        child: Text(
                          'Log In',
                        ),
                      ),
                    ),
                  ), SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    child: Material(
                      color: kColorSkyLineGrey,
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          //Implement login functionality.
                          viewModel.routeToRegistrationView();
                        },
                        minWidth: 330.0,
                        height: 42.0,
                        child: Text(
                          'Don\'t have an account? Click here',
                        ),
                      ),
                    ),
                  ),
                ],
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
          ),
      );
  }
}
