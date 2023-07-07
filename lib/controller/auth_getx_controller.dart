import 'package:get/get.dart';
import 'package:firebase/fire_base/model/user.dart' as modelUser;
import '../fire_base/auth_fire_base.dart';
import '../fire_base/model/fire_base_respons.dart';

class AuthGetxController extends GetxController {
  login({email, password}) async {
    FireBaseResponse response =
        await AuthFireBAse().login(email: email, password: password);
  }

  register({required modelUser.User user}) async {
    return await AuthFireBAse().register(myUser: user);
  }
}
