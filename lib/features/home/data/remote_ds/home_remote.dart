import 'package:dartz/dartz.dart';
import 'package:user_list/core/data/remote_ds.dart';
import 'package:user_list/features/home/data/dtos/dtos.dart';

class HomeRemoteDs {
  static const String _getUser = "/api/";

  final ApiProvider _api;

  HomeRemoteDs(
    this._api,
  );

  Future<Either<String, UsersResponseDto?>> getUser() async {
    const uri = _getUser;

    return _api.fetch(
      uri,
      (b) => UsersResponseDto.fromJson(b),
    );
  }
}
