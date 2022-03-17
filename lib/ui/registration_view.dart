import 'package:flutter/material.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:skyline_template_app/viewmodels/registration_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';
import 'package:skyline_template_app/locator.dart';

class  RegistrationView extends StatefulWidget {
@override
_State createState() => _State();
}
class _State extends State<RegistrationView> {
  final experience = ["None", "1-3 years", "3-5 years", "5+ years"];
  String value;
  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<RegistrationViewModel>.reactive(
  disposeViewModel: false,
  viewModelBuilder: () => locator<RegistrationViewModel>(),
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
                  Container(child: Image.asset('assets/microphone.png'), height: 100, width: 100,),
                  SizedBox(
                    height: 18.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        viewModel.setName(value);
                      },
                      decoration: InputDecoration(filled: true,fillColor: kColorSkylineWhite,
                        hintText: 'Enter your name',
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
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
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
                    height: 8.0,
                  ),
                  Text("Select Experience Level"),
                  SizedBox(
                    height:1,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 4), borderRadius: BorderRadius.circular(12), color: Colors.white),
                    width: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: DropdownButton<String>(
                      value: value,
                      isExpanded: true,
                      items: experience.map(viewModel.buildMenuItem).toList(),
                      onChanged: (value){
                        setState(() => this.value = value);
                        viewModel.setExperience(value);
                      }
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
                         print(viewModel.email);
                         print(viewModel.password);
                         viewModel.registerUser();
                        },
                        minWidth: 330.0,
                        height: 42.0,
                        child: Text(
                          'Register',
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
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          //Implement login functionality.
                          viewModel.routeToLoginView();
                        },
                        minWidth: 330.0,
                        height: 42.0,
                        child: Text(
                          'Already have an account? Click here',
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



