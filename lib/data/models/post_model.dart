import 'package:cloud_firestore/cloud_firestore.dart';

class PostDM {
  late String name;
  late String photoPath;
  late String postContent;
  late DateTime date;
  late String id;

  PostDM(this.name, this.postContent, this.date, this.id);

  PostDM.fromJson(Map json){
    name = json["name"];
    photoPath = json["photo"];
    postContent = json["content"];
    Timestamp time = json["date"];
    date = time.toDate();
    id = json["id"];
  }
  Map<String, Object?> toJson(){
    return {
      "name" : name,
      "photo" : photoPath,
      "content" : postContent,
      "date" : date,
      "id" : id,
    };
  }
}
