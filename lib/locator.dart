import 'package:skyline_template_app/ui/offerSessions_view.dart';
import 'package:skyline_template_app/viewmodels/home_viewmodel.dart';
import 'package:skyline_template_app/viewmodels/offerSessions_viewModel.dart';
import 'package:skyline_template_app/viewmodels/student_viewmodel.dart';
import 'package:skyline_template_app/viewmodels/teacher_viewmodel.dart';
import 'package:skyline_template_app/viewmodels/login_viewmodel.dart';
import 'package:skyline_template_app/viewmodels/registration_viewmodel.dart';
import 'package:skyline_template_app/core/services/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'viewmodels/home_viewmodel.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  _setupViewModels();
  _setupServices();
}


  Future _setupViewModels() async {
    locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
    locator.registerLazySingleton<TeacherViewModel>(() => TeacherViewModel());
    locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
    locator.registerLazySingleton<RegistrationViewModel>(() => RegistrationViewModel());
    locator.registerLazySingleton<OfferSessionsViewModel>(() => OfferSessionsViewModel());
    locator.registerLazySingleton<StudentViewModel>(() => StudentViewModel());
}
Future _setupServices() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
}