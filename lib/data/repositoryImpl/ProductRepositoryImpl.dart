

import 'package:injectable/injectable.dart';

import '../../domain/model/Product.dart';
import '../../domain/repositoryContract/ProductRepository.dart';
import '../DataSouceContract/ProductDataSource.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository{
  ProductDataSource OnlineDateSource;
  @factoryMethod
  ProductRepositoryImpl(this.OnlineDateSource);

  @override
  Future<List<Product>?> getProduct({productSort? bySort}) {
return OnlineDateSource.getProduct(Sort: bySort);
  }


}