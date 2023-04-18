import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/theme/app_assets.dart';
import 'package:house_jet_properties/ui/screens/main/home_screen/home_controller.dart';
import 'package:house_jet_properties/ui/screens/main/profile_screen/change_password/change_password.dart';
import 'package:house_jet_properties/ui/screens/main/profile_screen/edit_profile/edit_profile.dart';
import 'package:house_jet_properties/ui/screens/main/profile_screen/edit_profile/edit_profile_controller.dart';
import 'package:house_jet_properties/ui/screens/startup/login_screen/login_screen.dart';
import 'package:house_jet_properties/ui/widgets/app_listtile.dart';
import 'package:house_jet_properties/utils/extension.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  EditProfileController editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.white,
        //   statusBarIconBrightness: Brightness.dark,
        // ),
        elevation: 5,
        bottomOpacity: 1.0,
        centerTitle: true,
        toolbarHeight: 80,
        shadowColor: Colors.grey.withOpacity(0.15),
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: "My Profile".darkText(size: 20, fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<EditProfileController>(
        builder: (ctrl) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                (30.0).addHSpace(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(profileDashedIcon),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: CircleAvatar(

                        backgroundImage: ctrl.profileImage == null
                            ? Image.asset(userProfileImage).image
                            : Image.file(ctrl.profileImage!, fit: BoxFit.fill)
                                .image,
                      ),
                    ),
                  ),
                ),
                (15.0).addHSpace(),
                "Michael Dam "
                    .appBlackText1B1B1B(size: 18, fontWeight: FontWeight.w600),
                (4.0).addHSpace(),
                "michaeldam@gmail.com"
                    .appGreyText(size: 16, fontWeight: FontWeight.w500),
                (30.0).addHSpace(),
                AppListTile(
                  title: "Edit Profile",
                  icon: editProfileIcon,
                  onTap: () => Get.to(EditProfile()),
                ),
                AppListTile(
                  title: "Change Password",
                  icon: changePassIcon,
                  onTap: () => Get.to(ChangePassword()),
                ),
                AppListTile(title: "Help", icon: helpIcon, onTap: () {}),
                AppListTile(
                    title: "Contact Us", icon: contactUsIcon, onTap: () {}),
                AppListTile(
                    title: "Log Out",
                    icon: logoutIcon,
                    textColor: false,
                    onTap: () {
                      preferences.clearUserItem();
                      Get.find<HomeScreenController>().currentIndex.value = 0;
                      // HomeScreenController().currentIndex.value = 0;

                      // Get.off(LoginScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
