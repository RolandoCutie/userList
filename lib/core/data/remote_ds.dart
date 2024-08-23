import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  static String defaultMessage = "default".tr;

  ApiProvider();

  Future<Either<String, T?>> fetch<T>(
    String endpoint,
    T Function(dynamic) converter, {
    Map<String, dynamic>? params,
    String? recaptchaToken,
  }) async {
    final result = await get(
      "${'https://randomuser.me/'}$endpoint",
      decoder: converter,
      query: params,
    );

    if (result.hasError) {
      return left(defaultMessage);
    }
    return right(result.body);
  }
}
