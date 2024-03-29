import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/AddToWishResponse.dart';
@injectable
class AddToWishListUseCase {
  HomeRepo homeRepo;

  AddToWishListUseCase(this.homeRepo);

  Future<Either<AddToWishResponse?, Failures>> call(String productId) =>
      homeRepo.addToWishList(productId);
}
