import 'package:dartz/dartz.dart';

import '../../../../helper/dio_helper.dart';
import '../../domain/repositories/home_repo.dart';
import '../entitis/product_respo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Exception, bool>> addToCart() {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<ResponseProduct>>> fetchProducts() async {
    try {
      var products = <ResponseProduct>[];
      var response =
          await DioHelper.getData(url: "http://fakestoreapi.com/products");
      products.addAll(response.data.map<ResponseProduct>((product) {
        ResponseProduct.fromJson(product);
      }).toList());

      return right(products);
    } catch (e) {
      return left(
        Exception("something wrong .... "),
      );
    }
  }
}
