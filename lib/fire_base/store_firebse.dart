import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/fire_base/model/fire_base_respons.dart';
import 'package:firebase/fire_base/model/user.dart';

import 'auth_fire_base.dart';

class StoreFireBase {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<FireBaseResponse> addUserData(User user) async {
    try {
      await firebaseFirestore
          .collection("Users")
          .doc(user.id)
          .set(user.toJson());
      return FireBaseResponse(massage: 'Verify Your Account', status: true);
    } catch (e) {
      return FireBaseResponse(massage: e.toString(), status: false);
    }
  }

  Future<List<User>> getUserData() async {
    List<User> list = [];
    return await firebaseFirestore
        .collection("Users")
        .where('id', isEqualTo: AuthFireBAse().instanse.currentUser!.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        User u = User.fromJson(element.data());
        list.add(u);
      });
      return list;
    });
  }

  Future<List<User>> getAllUsers() async {
    List<User> list = [];
    return await firebaseFirestore
        .collection("Users")
        .where('id', isNotEqualTo: AuthFireBAse().instanse.currentUser!.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        User u = User.fromJson(element.data());
        list.add(u);
      });
      return list;
    });
  }

  updateUser(user) {
    firebaseFirestore.collection("Users").doc(user.id).update(user.tojson());
  }
}
