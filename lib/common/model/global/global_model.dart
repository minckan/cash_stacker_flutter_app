abstract class GlobalBase {}

class GlobalError extends GlobalBase {
  final String errorMessage;

  GlobalError({required this.errorMessage});
}

class GlobalLoading extends GlobalBase {}

class GlobalModel<T> extends GlobalBase {
  final T data;

  GlobalModel({required this.data});
}
