import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SalesInvoiceController extends GetxController {
  final Dio dio = Dio();

  RxBool isLoading = false.obs;
  RxList invoices = [].obs;

  @override
  void onInit() {
    fetchInvoices();
    super.onInit();
  }

  Future<void> fetchInvoices() async {
  try {
    isLoading.value = true;

    final response = await dio.get(
      "http://142.93.214.133:3641/api/vansale.index",
      queryParameters: {
        "user_id": "150",
        "store_id": "112",
        "van_id": "0",
      },
    );

    print(response.data);

    // Get all invoice records
    invoices.value =
        response.data["data"]["data"] ?? [];

  } catch (e) {
    print(e);
    Get.snackbar(
      "Error",
      e.toString(),
    );
  } finally {
    isLoading.value = false;
  }
}
}
