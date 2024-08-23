import 'package:dartz/dartz.dart';

abstract class ActionUseCase<T> {
  Future<Either<String, T>> run();
}

abstract class UseCase<T, P> {
  Future<Either<String, T>> run(P param);
}

