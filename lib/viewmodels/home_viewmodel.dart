import 'package:skyline_template_app/viewmodels/base_viewmodel.dart';
import 'package:skyline_template_app/core/enums/view_state.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:skyline_template_app/core/services/navigation_service.dart';
import 'package:skyline_template_app/core/utilities/route_names.dart';

class HomeViewModel extends BaseViewModel {
  final  _navigationService = locator<NavigationService>();


  Future init() async {
    print("HomeViewModel init()");
    setState(ViewState.Busy);
    try {
      _initMethod();
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);

    }
    
    void _initMethod(){
    for (int i = 0; i < 2; i++) {
      print(
          "HomeViewModel Init() function called printing $i iteration of my for loop");
    }
    }

  void routeToOfferSessionsView() {
    _navigationService.navigateTo(OfferSessionsViewRoute);
  }
}