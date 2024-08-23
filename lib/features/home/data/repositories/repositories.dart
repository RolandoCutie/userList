
import 'package:dartz/dartz.dart';
import 'package:user_list/features/home/data/dtos/dtos.dart';
import 'package:user_list/features/home/data/remote_ds/home_remote.dart';

class HomeRepository {
  final HomeRemoteDs _ds;

  HomeRepository(this._ds);

  Future<Either<String, UsersResponseDto?>> getUser(
      ) async {
    return _ds.getUser();
  }
}
