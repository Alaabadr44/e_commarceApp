









import 'package:dartz/dartz.dart';

import '../../data/entitis/product_respo.dart';

abstract class HomeRepo{
  Future <Either<Exception,List<ResponseProduct>>> fetchProducts();

  Future <Either<Exception,bool>> addToCart();
}