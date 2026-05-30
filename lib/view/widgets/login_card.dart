import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/controller/getx/controller.dart';
import 'package:mobiz/utils/appcolors.dart';
import 'package:mobiz/view/widgets/custom_textfields.dart';

class LoginCardWidget extends StatelessWidget {
  final MobizController controller;

  const LoginCardWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin:
            const EdgeInsets.symmetric(
              horizontal: 35,
            ),
        padding: const EdgeInsets.all(25),
        height: 530,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius:
              BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.blk.withOpacity(
                .15,
              ),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              "Log In",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "Please sign in with your details",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.blk,
              ),
            ),

            const SizedBox(height: 20),

            // Email Field
            customTextField(
              controller:
                  controller.emailController,
              hint: "Email",
              icon: Icons.email,
            ),

            const SizedBox(height: 35),

            // Password Field
            Obx(
              () => customTextField(
                controller:
                    controller
                        .passwordController,
                hint: "Password",
                icon: Icons.lock,
                isPassword: true,
                obscureText: controller
                    .isPasswordHidden.value,
                onTap: controller
                    .togglePasswordVisibility,
              ),
            ),

            const SizedBox(height: 60),

            // Login Button
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(
                        backgroundColor:AppColors.blue,
                        shape:
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                    20,
                                  ),
                            ),
                      ),
                  onPressed:
                      controller
                              .isLoading
                              .value
                          ? null
                          : controller.login,
                  child:
                      controller
                              .isLoading
                              .value
                          ? const CircularProgressIndicator(
                              color:
                                  AppColors.white,
                            )
                          : const Text(
                              "Log In",
                              style:
                                  TextStyle(
                                    fontSize:
                                        28,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    color:
                                        AppColors
                                            .white,
                                  ),
                            ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}