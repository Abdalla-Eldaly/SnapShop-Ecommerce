// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/apiManger/ApiManger.dart' as _i3;
import '../data/DataSouceContract/BrandsDataSource.dart' as _i4;
import '../data/DataSouceContract/CategoriesDataSource.dart' as _i8;
import '../data/DataSouceContract/ProductDataSource.dart' as _i17;
import '../data/DataSourceImpl/BrandsOnlineDataSource.dart' as _i5;
import '../data/DataSourceImpl/CategoriesOnlineDataSource.dart' as _i9;
import '../data/DataSourceImpl/ProductOnlineDataSource.dart' as _i18;
import '../data/repositoryImpl/BrandRepositoryImpl.dart' as _i7;
import '../data/repositoryImpl/CategoryRepositoryImpl.dart' as _i11;
import '../data/repositoryImpl/ProductRepositoryImpl.dart' as _i20;
import '../domain/model/Product.dart' as _i13;
import '../domain/repositoryContract/BrandsRepository.dart' as _i6;
import '../domain/repositoryContract/CategoriesRepository.dart' as _i10;
import '../domain/repositoryContract/ProductRepository.dart' as _i19;
import '../domain/usecase/getBrandsUseCase.dart' as _i15;
import '../domain/usecase/getCategoriesUseCase.dart' as _i16;
import '../domain/usecase/getProductUseCase.dart' as _i21;
import '../ui/homeFragmentation/homePage/DetailsViewAll/DetailsViewAll.dart'
    as _i12;
import '../ui/homeFragmentation/homePage/HomeTab/HomeTabViewModel.dart' as _i22;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.BrandsDataSource>(
        () => _i5.BrandsOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i6.BrandsRepository>(
        () => _i7.BrandsRepositoryImpl(gh<_i4.BrandsDataSource>()));
    gh.factory<_i8.CategoriesDataSource>(
        () => _i9.CategoriesOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i10.CategoriesRepository>(
        () => _i11.CategoryRepositoryImpl(gh<_i8.CategoriesDataSource>()));

    gh.factory<_i15.GetBrandsUseCase>(
        () => _i15.GetBrandsUseCase(gh<_i6.BrandsRepository>()));
    gh.factory<_i16.GetCategoriesUseCase>(
        () => _i16.GetCategoriesUseCase(gh<_i10.CategoriesRepository>()));

    gh.factory<_i21.GetProductUseCase>(
        () => _i21.GetProductUseCase(gh<_i19.ProductRepository>()));
    gh.factory<_i22.HomeTabViewModel>(() => _i22.HomeTabViewModel(
          gh<_i16.GetCategoriesUseCase>(),
          gh<_i15.GetBrandsUseCase>(),
          gh<_i21.GetProductUseCase>(),
        ));
    return this;
  }
}
