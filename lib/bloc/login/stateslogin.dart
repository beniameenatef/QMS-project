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





