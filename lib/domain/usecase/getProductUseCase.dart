

import 'package:injectable/injectable.dart';

import '../model/Product.dart';
import '../repositoryContract/ProductRepository.dart';

@injectable
class GetProductUseCase{
  ProductRepository respository;
  @factoryMethod
  GetProductUseCase(this.respository);


  Future<List<Product>?> involke(){
    return  respository.getProduct(bySort: productSort.mostSetling);
  }

}