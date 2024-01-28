
import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';

import '../../../../core/error/failuers.dart';
import '../entities/ProductEntity.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishListUseCase {
  HomeRepo homeRepo;

  GetWishListUseCase(this.homeRepo);
  Future<Either<ProductEntity?, Failures>> call ()=>homeRepo.getWishList();
}
