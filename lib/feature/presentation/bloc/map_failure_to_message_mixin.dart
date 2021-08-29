import 'package:rickandmortywiki/core/error/failure.dart';

class MapFailureToMessageMixin {
  static const String SERVER_ERROR = "Server error";
  static const String CACHE_ERROR = "Cache error";
  static const String UNEXPECTED_ERROR = "Unexpected error";

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_ERROR;
      case CacheFailure:
        return CACHE_ERROR;
      default:
        return UNEXPECTED_ERROR;
    }
  }
}
