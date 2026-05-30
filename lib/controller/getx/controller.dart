import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/view/dashboad/dash_screen.dart';

class MobizController extends GetxController {
  final dio.Dio dioClient = dio.Dio();

  // Text Controllers
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  // Loading States
  RxBool isLoading = false.obs;
  RxBool isProductLoading = false.obs;
  RxBool isCustomerLoading = false.obs;

  // Password Visibility
  RxBool isPasswordHidden = true.obs;

  // Data Lists
  RxList<dynamic> customerList = <dynamic>[].obs;
  RxList<dynamic> productList = <dynamic>[].obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value =
        !isPasswordHidden.value;
  }

  // ================= LOGIN =================

  Future<void> login() async {
    try {
      isLoading.value = true;

      final response = await dioClient.post(
        "http://142.93.214.133:3641/api/login",
        data: {
          "email":
              emailController.text.trim(),
          "password":
              passwordController.text.trim(),
        },
      );

      debugPrint(
        "LOGIN RESPONSE => ${response.data}",
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Login Successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.offAll(
          () => const DashScreen(),
        );
      }
    } on dio.DioException catch (e) {
      debugPrint(
        "LOGIN ERROR => ${e.response?.data}",
      );

      Get.snackbar(
        "Error",
        e.response?.data["message"] ??
            "Login Failed",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // ================= CUSTOMERS =================

  Future<void> getCustomers() async {
    try {
      isCustomerLoading.value = true;

      final response = await dioClient.get(
        "http://142.93.214.133:3641/api/get_customer",
        queryParameters: {
          "route_id": "84",
          "store_id": "112",
        },
      );

      debugPrint(
        "CUSTOMER RESPONSE => ${response.data}",
        wrapWidth: 1024,
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        customerList.assignAll(
          response.data["data"] ?? [],
        );

        debugPrint(
          "Customer Count => ${customerList.length}",
        );
      }
    } on dio.DioException catch (e) {
      debugPrint(
        "CUSTOMER ERROR => ${e.response?.data}",
      );

      Get.snackbar(
        "Error",
        "Failed to load customers",
      );
    } finally {
      isCustomerLoading.value = false;
    }
  }

  // ================= PRODUCTS =================

  Future<void> getProducts() async {
    try {
      isProductLoading.value = true;

      final response = await dioClient.get(
        "http://142.93.214.133:3641/api/get_product",
        queryParameters: {
          "store_id": "112",
        },
      );
      print("get product called");
      debugPrint(
        "PRODUCT RESPONSE => ${response.data}",
       wrapWidth: 1024,
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        productList.assignAll(
          response.data["data"] ?? [],
        );

        debugPrint(
          "Products Count => ${productList.length}",
        );

        if (productList.isNotEmpty) {
          debugPrint(
            "First Product => ${productList.first}",
          );
        }
      }
    } on dio.DioException catch (e) {
      debugPrint(
        "PRODUCT ERROR => ${e.response?.data}",
      );

      Get.snackbar(
        "Error",
        "Failed to load products",
      );
    } finally {
      isProductLoading.value = false;
    }
  }

  @override
void onInit() {
  super.onInit();

  print("MobizController Initialized");

  getCustomers();
  getProducts();
}

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}