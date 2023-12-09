import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/app_color.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    Widget content = CircleAvatar(
      backgroundColor: AppColor.liteGrey,
      radius: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: const Icon(Icons.camera_alt_outlined, color: AppColor.black),
      ),
    );
    if (_selectedImage != null) {
      content = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: AppColor.grey
          )
        ),
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.file(
            _selectedImage!,
            fit: BoxFit.cover, // Make the image fit within the CircleAvatar
          ),
        ),
      );
    }
    return InkWell(
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
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }
}
