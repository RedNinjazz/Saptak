import 'package:flutter/material.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:skyline_template_app/viewmodels/home_viewmodel.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => Scaffold(
            backgroundColor: Colors.yellowAccent,
            body: Column(
              children: [
                Container(
                  child: Center(child: Text("Saptak",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.cyan),)),
                ),SizedBox(height: 10,),
                Container(child: Image.asset('assets/microphone.png'), height: 100, width: 100,),
                SizedBox(height: 50,),
                Row(
                children: [

                  SizedBox(width: 2,),
                  ElevatedButton(onPressed: () {
                  viewModel.routeToOfferSessionsView();
                }, style: ElevatedButton.styleFrom(primary: kColorSkyLineGrey, ),child: Text("Upcoming Classes",style: TextStyle(color: kColorSkylineGreen),),),
                  SizedBox(width: 119,),
                  ElevatedButton(onPressed: () {
                    viewModel.routeToOfferSessionsView();
                  }, style: ElevatedButton.styleFrom(primary: kColorSkyLineGrey, ),child: Text("Offer Lessons",style: TextStyle(color: kColorSkylineGreen),),),

              ])
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        );

  }
}
