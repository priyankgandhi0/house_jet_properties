import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../theme/app_colors.dart';

class PickImageOnly {

  void openImageChooser(
      {required BuildContext context,
      required Function(File? image) onImageChose,
      wantFile = false}) {
    Platform.isIOS
        ? wantFile
            ? _imageFormGallery(
                wantFile: wantFile,
                context: context,
                onImageChose: (image) {
                  onImageChose(image);
                })
            : showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SafeArea(
                    child: Wrap(
                      children: [
                        ListTile(
                          title: const Text("Gallery"),
                          leading: const Icon(Icons.photo_library),
                          onTap: () {
                            _imageFormGallery(
                                wantFile: false,
                                context: context,
                                onImageChose: (image) {
                                  onImageChose(image);
                                });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("Camera"),
                          leading: const Icon(Icons.photo_camera),
                          onTap: () {
                            _imageFromCamera(
                                context: context,
                                onImageChose: (image) {
                                  onImageChose(image);
                                });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              )
        : wantFile
            ? _imageFormGallery(
                wantFile: wantFile,
                context: context,
                onImageChose: (image) {
                  onImageChose(image);
                })
            : showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text("Select Image"),
                    children: [
                      ListTile(
                        title: const Text("Photo Library"),
                        leading: const Icon(Icons.photo_library),
                        onTap: () {
                          _imageFormGallery(
                              wantFile: false,
                              context: context,
                              onImageChose: (image) {
                                onImageChose(image);
                              });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text("Camera"),
                        leading: const Icon(Icons.photo_camera),
                        onTap: () {
                          _imageFromCamera(
                              context: context,
                              onImageChose: (image) {
                                onImageChose(image);
                              });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
  }

  void _imageFormGallery(
      {required BuildContext context,
      required Function(File? image) onImageChose,
      required bool wantFile}) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
          type: wantFile == true ? FileType.custom : FileType.image,
          allowedExtensions: wantFile ? ["xls", "xlsx"] : null);
      if (pickedFile != null) {
        onImageChose(File(pickedFile.files.single.path!));
      }

      return;
    } else if (status.isDenied) {
      Get.showSnackbar(
        GetSnackBar(
            message: "Without this permission app can not change picture.",
            mainButton: Platform.isIOS
                ? SnackBarAction(
                    label: "Settings",
                    textColor: app_Orange_FF7448,
                    onPressed: () {
                      openAppSettings();
                    },
                  )
                : null,
            duration: const Duration(seconds: 4)),
      );
      return;
    } else if (status.isPermanentlyDenied) {
      Get.showSnackbar(
        GetSnackBar(
          message:
              "To access this feature please grant files and media permission from settings.",
          mainButton: SnackBarAction(
            label: "Settings",
            textColor: app_Orange_FF7448,
            onPressed: () {
              openAppSettings();
            },
          ),
          duration: const Duration(seconds: 4),
        ),
      );
      return;
    }
  }

  void _imageFromCamera(
      {required BuildContext context,
      required Function(File? image) onImageChose}) async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 100);
      if (pickedFile != null) {
        // controller.addImage(File(pickedFile.path));
        onImageChose(File(pickedFile.path));
      }
      return;
    } else if (status.isDenied) {
      Get.showSnackbar(
        GetSnackBar(
            message:
                "Without this permission app can not change profile picture.",
            mainButton: Platform.isIOS
                ? SnackBarAction(
                    label: "Settings",
                    textColor: app_Orange_FF7448,
                    onPressed: () {
                      openAppSettings();
                    },

                  )
                : SnackBarAction(

                    label: "Settings",
                    textColor: app_Orange_FF7448,
                    onPressed: () {
                      openAppSettings();
                    },
                  ),
            duration: const Duration(seconds: 4)),
      );
      return;
    } else if (status.isPermanentlyDenied) {
      Get.showSnackbar(
        GetSnackBar(
            message:
                "To access this feature please grant camera permission from settings.",
            mainButton: SnackBarAction(
              label: "Settings",
              textColor: app_Orange_FF7448,
              onPressed: () {
                openAppSettings();
              },
            ),
            duration: const Duration(seconds: 4)),
      );
      return;
    }
  }
}
