import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/controller/getx/controller.dart';
import 'package:mobiz/utils/appcolors.dart';
import 'package:mobiz/view/selectcustomer/selectcustomer.dart';

class Customerlist extends StatelessWidget {
  const Customerlist({super.key});

  @override
  Widget build(BuildContext context) {

    final MobizController controller =
        Get.put(MobizController());

    return Scaffold(

      backgroundColor:
           AppColors.white,

      appBar: AppBar(

        backgroundColor: AppColors.blue,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Get.back();
          },

          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 30,
          ),
        ),

        title: const Text(
          "Shops",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 22,
          ),
        ),

        actions: const [

          Icon(
            Icons.search,
            color: AppColors.white,
            size: 30,
          ),

          SizedBox(width: 20),

          Padding(
            padding: EdgeInsets.only(
              right: 15,
            ),

            child: Icon(
              Icons.add,
              color: AppColors.white,
              size: 34,
            ),
          ),
        ],
      ),

      body: Obx(() {

        // Loading
        if (controller.isLoading.value) {

          return const Center(
            child:
                CircularProgressIndicator(),
          );
        }

        // Empty Data
        if (controller.customerList.isEmpty) {

          return const Center(
            child: Text(
              "No Customers Found",
            ),
          );
        }

        // Customer List
        return ListView.builder(

          padding:
              const EdgeInsets.symmetric(
            vertical: 10,
          ),

          itemCount:
              controller.customerList.length,

          itemBuilder: (context, index) {

            final customer =
                controller.customerList[index];

            print(
              customer["cust_image"],
            );

            return GestureDetector(
              onTap: (){
                Get.to(
                  ()=>CustomerDetailsScreen(customer:customer)
                );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
              
                padding:
                    const EdgeInsets.all(10),
              
                decoration: BoxDecoration(
                  color: AppColors.white,
              
                  borderRadius:
                      BorderRadius.circular(
                    18,
                  ),
              
                  boxShadow: [
              
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(.12),
              
                      blurRadius: 8,
              
                      offset: const Offset(
                        0,
                        3,
                      ),
                    ),
                  ],
                ),
              
                child: Row(
              
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
              
                  children: [
              
                    // Customer Image
                    ClipRRect(
              
                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
              
                      child:
              
                          customer["cust_image"] !=
                                      null &&
                                  customer["cust_image"]
                                      .toString()
                                      .isNotEmpty
              
                              ? Image.network(
              
                                  customer["cust_image"]
                                      .toString(),
              
                                  height: 80,
                                  width: 80,
              
                                  fit: BoxFit.cover,
              
                                  errorBuilder: (
                                    context,
                                    error,
                                    stackTrace,
                                  ) {
              
                                    return Container(
              
                                      height: 80,
                                      width: 80,
              
                                      color:
                                          Colors.grey
                                              .shade200,
              
                                      child: Icon(
                                        Icons
                                            .camera_alt_outlined,
              
                                        size: 35,
              
                                        color: Colors
                                            .grey
                                            .shade400,
                                      ),
                                    );
                                  },
                                )
              
                              : Container(
              
                                  height: 80,
                                  width: 80,
              
                                  color:
                                      Colors.grey
                                          .shade200,
              
                                  child: Icon(
                                    Icons
                                        .camera_alt_outlined,
              
                                    size: 35,
              
                                    color: Colors
                                        .grey
                                        .shade400,
                                  ),
                                ),
                    ),
              
                    const SizedBox(width: 15),
              
                    // Customer Details
                    Expanded(
              
                      child: Column(
              
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
              
                        children: [
              
                          Text(
              
                            customer["name"]
                                .toString(),
              
                            style:
                                const TextStyle(
                              fontSize: 20,
              
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
              
                          const SizedBox(
                            height: 8,
                          ),
              
                          Text(
              
                            "Address : ${customer["address"]}",
              
                            style:
                                const TextStyle(
                              fontSize: 16,
                            ),
                          ),
              
                          const SizedBox(
                            height: 5,
                          ),
              
                          Text(
              
                            "Contact : ${customer["contact_number"]}",
              
                            style:
                                const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}