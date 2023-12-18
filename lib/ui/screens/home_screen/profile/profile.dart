import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health360/data/models/user_model.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/button.dart';
import 'package:health360/ui/screens/home_screen/profile/profile_components/pick_image.dart';
import 'package:health360/ui/screens/home_screen/profile/profile_components/profile_text_field.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/app_theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(onPressed: () {
              Navigator.pop(context);
            },
                icon: Icon(CupertinoIcons.xmark,
                  color: Theme.of(context) == AppTheme.lightMode ? AppColor
                      .black : AppColor.white,)),
          ),
          Text("Hey, ${firstName(AppUser.currentUser!.fullName)}",
            style: Theme.of(context).textTheme.headlineLarge,),
          const PickImage(),
          ProfileTextField(text: "Name: ${AppUser.currentUser!.fullName}",),
          ProfileTextField(text: "E-mail: ${AppUser.currentUser!.email}",),
          ProfileTextField(text: "ID: ${AppUser.currentUser!.id}",),
          MyButton(
            text: "Edit", onPressed: () {}, icon: const Icon(Icons.edit),),
        ],
      ),
    );
  }

  String firstName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    if (nameParts.isNotEmpty) {
      return nameParts[0];
    } else {
      return '';
    }
  }


}
