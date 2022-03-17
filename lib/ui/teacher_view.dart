import 'package:flutter/material.dart';
import 'package:skyline_template_app/viewmodels/teacher_viewmodel.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:skyline_template_app/locator.dart';

class TeacherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherViewModel>.reactive(
      viewModelBuilder: () => locator<TeacherViewModel>(),
      disposeViewModel: false,
      onModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) => Scaffold(
            backgroundColor: kColorSkylineGreen,
            body: Column(
              children: [
                Container(
                  child: Center(
                      child: Text(
                    "Teachers Page",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: kColorSkylineWhite),
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 400,
                  color: kColorSkyLineGrey,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final firstName = viewModel.teachers[index].firstName ?? 'na';
                      final lastName = viewModel.teachers[index].lastName ?? 'na';
                      final email = viewModel.teachers[index].email ?? 'na';
                      return ListTile(tileColor: index%2 ==0 ? kColorSkyLineGrey : kColorSkylineDarkGrey,
                        title: Text('$firstName $lastName'),
                        subtitle: Text(email),
                      );
                    },
                    itemCount: viewModel.teachers.length,
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        viewModel.addTeacher();
                      },style: ElevatedButton.styleFrom(
                      primary:kColorSkyLineGrey,),
                      child: Text('Add Teacher',style: TextStyle(color: kColorSkylineGreen)),
                    ),SizedBox(width: 5,),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.routeToHomeView();
                      },style: ElevatedButton.styleFrom(
                      primary: kColorSkyLineGrey),
                      child: Text('Return to HomeView',style: TextStyle(color: kColorSkylineGreen)),
                    ),
                  ],
                ),
              ],
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
    );
  }
}
