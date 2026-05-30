import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class GetProductController extends GetxController{
  final dio.Dio dioClient = dio.Dio();
    RxBool isProductLoading = false.obs;
      RxList<dynamic> productList = <dynamic>[].obs;


      
  Future<void> getProducts() async {
  try {
    isProductLoading.value = true;

    final response = await dioClient.get(
      "http://142.93.214.133:3641/api/get_product",
      queryParameters: {
        "store_id": "112",
      },
    );

    print(response.data);

    if (response.statusCode == 200) {
      productList.assignAll(
        response.data["data"]["data"] ?? [],
      );

      print(
        "Products Count: ${productList.length}",
      );

      if (productList.isNotEmpty) {
        print(productList.first);
      }
    }
  } on dio.DioException catch (e) {
    print(e.response?.data);
  } finally {
    isProductLoading.value = false;
  }
}
  @override
void onInit() {
  super.onInit();

  print("productlistcontroller Initialized");


  getProducts();
}
}