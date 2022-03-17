import 'package:flutter/material.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:skyline_template_app/viewmodels/offerSessions_viewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:stacked/stacked.dart';

class OfferSessionsView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<OfferSessionsView> {

  final times = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'];
  String value;
  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<OfferSessionsViewModel>.reactive(
  disposeViewModel: false,
  viewModelBuilder: () => locator<OfferSessionsViewModel>(),
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
  viewModel.setDate(value);
  },
  decoration: InputDecoration(filled: true,fillColor: kColorSkylineWhite,
  hintText: 'Date in format MMDD',
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
  onChanged: (value) {
  //Do something with the user input.
  viewModel.setTime(value);
  },
  decoration: InputDecoration(filled: true,fillColor: kColorSkylineWhite,
  hintText: 'Time',
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
  Container(
  decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 4), borderRadius: BorderRadius.circular(12), color: Colors.white),
  width: 300,
  padding: const EdgeInsets.symmetric(horizontal: 5),
  child: DropdownButton<String>(
  value: value,
  isExpanded: true,
  items: times.map(viewModel.buildMenuItem).toList(),
  onChanged: (value){
  setState(() => this.value = value);
  viewModel.setExperience(value);
  }
  ),
  ),
  SizedBox(
  height: 8.0,
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
  viewModel.offerSessions();
  },
  minWidth: 330.0,
  height: 42.0,
  child: Text(
  'Offer',
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
