// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/api_manager.dart' as _i3;
import 'featuers/cart/data/data_sources/cart_ds.dart' as _i4;
import 'featuers/cart/data/data_sources/cart_ds_impl.dart' as _i5;
import 'featuers/cart/data/repositories/CartRepoImpl.dart' as _i7;
import 'featuers/cart/domain/repositories/CartRepo.dart' as _i6;
import 'featuers/cart/domain/use_cases/get_cart_products_useCase.dart' as _i8;
import 'featuers/cart/presentation/bloc/cart_bloc.dart' as _i34;
import 'featuers/home/data/data_sources/local/home_local_ds.dart' as _i11;
import 'featuers/home/data/data_sources/local/home_local_ds_impl.dart' as _i12;
import 'featuers/home/data/data_sources/remot/home_ds.dart' as _i9;
import 'featuers/home/data/data_sources/remot/home_ds_impl.dart' as _i10;
import 'featuers/home/data/repositories/home_repo_impl.dart' as _i14;
import 'featuers/home/domain/repositories/home_repo.dart' as _i13;
import 'featuers/home/domain/use_cases/add_to_wish_list_use_case.dart' as _i33;
import 'featuers/home/domain/use_cases/AddToCartUseCase.dart' as _i31;
import 'featuers/home/domain/use_cases/get_brands_use_case.dart' as _i36;
import 'featuers/home/domain/use_cases/get_category_use_case.dart' as _i37;
import 'featuers/home/domain/use_cases/get_product.dart' as _i38;
import 'featuers/home/domain/use_cases/get_sub_category_usecase.dart' as _i39;
import 'featuers/home/domain/use_cases/get_wish_list.dart' as _i41;
import 'featuers/home/domain/use_cases/remove_from_wish_list_usecase.dart'
    as _i27;
import 'featuers/home/presentation/bloc/home_bloc.dart' as _i42;
import 'featuers/login/data/data_sources/local/login_local_ds.dart' as _i17;
import 'featuers/login/data/data_sources/local/login_local_ds_impl.dart'
    as _i18;
import 'featuers/login/data/data_sources/remot/login_ds.dart' as _i15;
import 'featuers/login/data/data_sources/remot/login_ds_impl.dart' as _i16;
import 'featuers/login/domain/repositories/login_repo.dart' as _i20;
import 'featuers/login/domain/use_cases/login_use_case.dart' as _i19;
import 'featuers/login/presentation/bloc/login_bloc.dart' as _i43;
import 'featuers/product_details/data/data_sources/product_details_ds_impl.dart'
    as _i22;
import 'featuers/product_details/data/data_sources/product_ds.dart' as _i21;
import 'featuers/product_details/data/repositories/product_details_repo_impl.dart'
    as _i24;
import 'featuers/product_details/domain/repositories/product_details_repo.dart'
    as _i23;
import 'featuers/product_details/domain/use_cases/add_to_wish_list_usecase.dart'
    as _i32;
import 'featuers/product_details/domain/use_cases/get_wish_list_ids_usecase.dart'
    as _i40;
import 'featuers/product_details/domain/use_cases/remove_from_wish_list_usecase.dart'
    as _i35;
import 'featuers/sinUp/data/data_sources/remot/remot_ds_impl.dart' as _i26;
import 'featuers/sinUp/data/data_sources/remot/remote_ds.dart' as _i25;
import 'featuers/sinUp/data/repositories/sign_up_repo_impl.dart' as _i29;
import 'featuers/sinUp/domain/repositories/sgin_up_repo.dart' as _i28;
import 'featuers/sinUp/domain/use_cases/sgin_up_use_case.dart' as _i30;

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
    gh.factory<_i4.CartDs>(() => _i5.CartDsImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.CartRepo>(() => _i7.CartRepoImpl(gh<_i4.CartDs>()));
    gh.factory<_i8.GetCartProductsUseCase>(
        () => _i8.GetCartProductsUseCase(gh<_i6.CartRepo>()));
    gh.factory<_i9.HomeDs>(() => _i10.HomeDSImpl(gh<_i3.ApiManager>()));
    gh.factory<_i11.HomeLocalDs>(() => _i12.HomeLocalDsImpl());
    gh.factory<_i13.HomeRepo>(() => _i14.HomeRepoImpl(gh<_i9.HomeDs>()));
    gh.factory<_i15.LoginDataSource>(
        () => _i16.LoginDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i17.LoginLocalDs>(() => _i18.LoginLocalDsImpl());
    gh.factory<_i19.LoginUseCase>(
        () => _i19.LoginUseCase(gh<_i20.LoginRepo>()));
    gh.factory<_i21.ProductDetailsDs>(
        () => _i22.ProductDetailsDSImpl(gh<_i3.ApiManager>()));
    gh.factory<_i23.ProductDetailsRpo>(
        () => _i24.ProductDetailsRepoImpl(gh<_i21.ProductDetailsDs>()));
    gh.factory<_i25.RemoteDataSource>(
        () => _i26.RemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i27.RemoveFromWishListUseCase>(
        () => _i27.RemoveFromWishListUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i28.SignUpRepo>(
        () => _i29.SignUpRepoImpl(gh<_i25.RemoteDataSource>()));
    gh.factory<_i30.SignUpUseCase>(
        () => _i30.SignUpUseCase(gh<_i28.SignUpRepo>()));
    gh.factory<_i31.AddToCartUseCase>(
        () => _i31.AddToCartUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i32.AddToWishListUseCase>(
        () => _i32.AddToWishListUseCase(gh<_i23.ProductDetailsRpo>()));
    gh.factory<_i33.AddToWishListUseCase>(
        () => _i33.AddToWishListUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i34.CartBloc>(
        () => _i34.CartBloc(gh<_i8.GetCartProductsUseCase>()));
    gh.factory<_i35.DeleteFromWishListUseCase>(
        () => _i35.DeleteFromWishListUseCase(gh<_i23.ProductDetailsRpo>()));
    gh.factory<_i36.GetBrandsUseCase>(
        () => _i36.GetBrandsUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i37.GetCategoryUseCase>(
        () => _i37.GetCategoryUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i38.GetProductUseCase>(
        () => _i38.GetProductUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i39.GetSubCategoryUseCase>(
        () => _i39.GetSubCategoryUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i40.GetWishListIdsUseCase>(
        () => _i40.GetWishListIdsUseCase(gh<_i23.ProductDetailsRpo>()));
    gh.factory<_i41.GetWishListUseCase>(
        () => _i41.GetWishListUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i42.HomeBloc>(() => _i42.HomeBloc(
          getCategoryUseCase: gh<_i37.GetCategoryUseCase>(),
          getBrandsUseCase: gh<_i36.GetBrandsUseCase>(),
          addToCartUseCase: gh<_i31.AddToCartUseCase>(),
          getSubCategoryUseCase: gh<_i39.GetSubCategoryUseCase>(),
          getProductUseCase: gh<_i38.GetProductUseCase>(),
          getWishListUseCase: gh<_i41.GetWishListUseCase>(),
          addToWishListUseCase: gh<_i33.AddToWishListUseCase>(),
          removeFromWishListUseCase: gh<_i27.RemoveFromWishListUseCase>(),
        ));
    gh.factory<_i43.LoginBloc>(() => _i43.LoginBloc(gh<_i19.LoginUseCase>()));
    return this;
  }
}
