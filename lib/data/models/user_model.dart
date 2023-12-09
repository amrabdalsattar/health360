import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser{
  late String id;
  late String email;
  late String fullName;
  static AppUser? currentUser;

  AppUser({required this.id, required this.email, required this.fullName});
  AppUser.fromJson(Map json){
    id = json["id"];
    email = json["email"];
    fullName = json["fullName"];
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "email": email,
      "fullName": fullName
    };
  }

  static CollectionReference<AppUser> collection(){
    return
      FirebaseFirestore.instance.collection("users").
      withConverter(fromFirestore: (snapshot, _){
        return AppUser.fromJson(snapshot.data()!);
      }, toFirestore: (user, _){
        return user.toJson();
      });
  }
}