
import 'package:arman_amin/core/network/error_handler.dart';

abstract class DataState<T> {
  final T? data;
  final ErrorHandler? error;

  const DataState({
    this.data,
    this.error,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({T? data}) : super(data:data,error: null);
}

class DataFailed<T> extends DataState<T> {
  DataFailed({
    required ErrorHandler error,
  }) : super(
          data:null,
          error:error,
        );
}
