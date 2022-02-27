import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/dio_helper.dart';
import '../../../account/design/screens/account/account_screen.dart';
import '../../../cart/design/screens/cart_screen/cart_screen.dart';
import '../../domain/repositories/home_repo.dart';
import '../screens/mainPage/main_page.dart';
import 'model/product_model.dart';

class HomePageViewM extends GetxController {
  HomePageViewM(this.repo);
  final HomeRepo repo;

 RxList<Product> products = <Product>[].obs;
 bool isloading = false;

  void getProduct() async {
    try {
      isloading = true;
      var response =
          await DioHelper.getData(url: "http://fakestoreapi.com/products");
      products.value = response.data.map<Product>((product) {
        return Product.fromJson(product);
      }).toList();
      // print(response.runtimeType);

//! second way
      // response.data.forEach((e) {
      //   // print(e);
      //   Product product = Product.fromJson(e);
      //   // print('product::::: ${product.toJson()}');
      //   products.value.add(product);
      // });

      // print(products.toJson());

      isloading = false;
    } on Exception catch (e) {
      isloading = false;
      throw Exception(e);
    }
  }

  void getProducts() async {
    var res = await repo.fetchProducts();
    // res.map((product) => );
  }

  @override
  void onInit() {
    // getProduct();
    super.onInit();
    // ignore: avoid_print
    print(" init HomeController ");
  }

  int bottomNavIndex = 0;
  List<Widget> screenBody = const [
    HomePageExploreBody(),
    HomePageCartBody(),
    HomePageAccountBody()
  ];

  void changeBottomNavIndex(int index) {
    bottomNavIndex = index;
    update();
  }
}
