import 'package:design_ui/models/userdatamodel.dart';

abstract class qualityloginstates {}

class qualityloginInitialState extends qualityloginstates {}



class visibalSuccessState extends qualityloginstates {}


class brancheSuccessState extends qualityloginstates {}



class loginloadingstate extends qualityloginstates {}
class loginsuccessstate extends qualityloginstates {

  final  Users? userdatamodel;

  loginsuccessstate(this.userdatamodel);

}
class loginerrorstate extends qualityloginstates {
   final String? error;

  loginerrorstate(this.error);
}

class registerloadingstate extends qualityloginstates {}
class registersuccessstate extends qualityloginstates {


  final  Users? userdatamodel;

  registersuccessstate(this.userdatamodel);


}
class registererrorstate extends qualityloginstates {
   final String? error;

   registererrorstate(this.error);
}

class putuserdataloadingstate extends qualityloginstates {}
class putuserdatasuccessstate extends qualityloginstates {


  final  Users? userdatamodel;

  putuserdatasuccessstate(this.userdatamodel);


}
class putuserdataerrorstate extends qualityloginstates {
   final String? error;

   putuserdataerrorstate(this.error);
}
class getuserdataloadingstate extends qualityloginstates {}
class getuserdatasuccessstate extends qualityloginstates {


  final  Users? userdatamodel;

  getuserdatasuccessstate(this.userdatamodel);


}
class getuserdataerrorstate extends qualityloginstates {
   final String? error;

   getuserdataerrorstate(this.error);
}





