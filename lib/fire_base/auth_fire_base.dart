import 'package:firebase/fire_base/store_firebse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/fire_base/model/user.dart' as mpdelUser;
import 'model/fire_base_respons.dart';

class AuthFireBAse {
  FirebaseAuth instanse = FirebaseAuth.instance;
  Future<FireBaseResponse> login({email, password}) async {
    return await instanse
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (value.user!.emailVerified) {
        return FireBaseResponse(status: true, massage: 'Login Successfully');
      } else {
        value.user!.sendEmailVerification();
        return FireBaseResponse(
            status: false, massage: 'Validate Your Account');
      }
    }).onError((error, stackTrace) {
      return FireBaseResponse(status: false, massage: error.toString());
    });
  }

  Future<FireBaseResponse> register({required mpdelUser.User myUser}) async {
    return await instanse
        .createUserWithEmailAndPassword(
            email: myUser.email, password: myUser.password)
        .then((value) {
      value.user!.sendEmailVerification();
      myUser.id = value.user!.uid;
      return StoreFireBase().addUserData(myUser);
    }).onError((error, stackTrace) {
      return FireBaseResponse(status: false, massage: error.toString());
    });
  }

  bool get isLogin => instanse.currentUser != null;
  forgetPassword({email}) {
    instanse.sendPasswordResetEmail(email: email);
  }

  // checkState() {
  //   instanse.authStateChanges().listen((event !) {});
  // }

  logout() {
    instanse.signOut();
  }
}
