import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/controller/getx/controller.dart';
import 'package:mobiz/utils/appcolors.dart';
import 'package:mobiz/view/widgets/login_card.dart';
import 'package:mobiz/view/widgets/top_section.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final MobizController controller = Get.put(MobizController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:AppColors.backgroundColor,
        body: Stack(
          children: [
            // Top Background
            TopSectionWidget(),
            // Login Card
            LoginCardWidget(controller: MobizController(),),
          ],
        ),
      ),
    );
  }

}