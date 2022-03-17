import 'package:skyline_template_app/core/utilities/route_names.dart';
import 'package:skyline_template_app/viewmodels/base_viewmodel.dart';
import 'package:skyline_template_app/core/enums/view_state.dart';
import 'package:skyline_template_app/model/Teacher.dart';
import 'package:skyline_template_app/core/services/navigation_service.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:faker/faker.dart';

class TeacherViewModel extends BaseViewModel {
  final  _navigationService = locator<NavigationService>();
  List<Teacher> teachers = [];
  bool pageLoaded = false;

  Future init() async {
    print("Teacher ViewModel init()");
    setState(ViewState.Busy);
    try {
_generateTeacherList(5);
pageLoaded = true;
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);

  }

  List _generateTeacherList(int teacherCount) {
    if (!pageLoaded == true)
    for (int i =0; i < teacherCount; i++){
      var faker = new Faker();//this package generates fictitious info...
      Teacher teacher = new Teacher(uid: 'xxx$i', firstName: faker.person.firstName(), lastName: faker.person.lastName(), nickName: 'Cool Teacher $i', email: faker.internet.email() );
    teachers.add(teacher);
    }
    teachers.forEach((element) {print('${element.firstName}, ${element.lastName}');});
    return teachers;
  }
  void addTeacher(){
    var faker = new Faker();//this package generates fictitious info...
    Teacher teacher = new Teacher(uid: 'xxx', firstName: faker.person.firstName(), lastName: faker.person.lastName(), nickName: 'Cool Teacher ', email: faker.internet.email() );
    teachers.add(teacher);
    print('Adding ${teacher.firstName} as a new teacher');
    notifyListeners();
  }

  void routeToHomeView(){
    _navigationService.navigateTo(HomeViewRoute);
  }

}