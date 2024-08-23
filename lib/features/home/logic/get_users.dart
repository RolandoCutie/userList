import 'package:dartz/dartz.dart';
import 'package:user_list/core/logic/use_case.dart';
import 'package:user_list/features/home/data/dtos/dtos.dart';

import 'package:user_list/features/home/data/repositories/repositories.dart';

class GetUsersUseCase extends ActionUseCase<UsersResponseDto?> {
  final HomeRepository _repository;

  GetUsersUseCase(this._repository);

  @override
  Future<Either<String, UsersResponseDto?>> run() async {
    return _repository.getUser();
  }
}
