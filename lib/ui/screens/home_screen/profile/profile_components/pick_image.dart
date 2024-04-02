import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_color.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  late SettingsProvider provider;
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    Widget content = CircleAvatar(
      backgroundImage: provider.isAssetPath
          ? AssetImage(provider.profileImagePath)
          : FileImage(File(provider.profileImagePath)) as ImageProvider<Object>?,
      
      radius: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Container(

            color: AppColor.liteGrey,
            width: 100.w,
            height: 100.h,
            child: const Icon(Icons.camera_alt_outlined, color: AppColor.black)),
      ),
    );
    if (_selectedImage != null) {
      content = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),

        ),
        width: 100.w,
        height: 95.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.file(
            File(provider.profileImagePath),
            fit: BoxFit.cover, // Make the image fit within the CircleAvatar
          ),
        ),
      );
    }
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      child: content,
      onTap: () {
        pickImage();
      },
    );
  }

  void pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    }
    provider.changeProfileImage(pickedImage.path);
    uploadImage();
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  void uploadImage() {

  }
}
