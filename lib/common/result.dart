import 'package:flutter/cupertino.dart';

class Result<T> {
  late final T? data;
  late final ErrorData? error;

  Result.ok(this.data) {
    error = null;
  }

  Result.err(this.error) {
    data = null;
  }

  bool get isOk => data != null && error == null;

  bool get isErr => data == null && error != null;

  bool get isEmpty => data == null && error == null;

  R tryOnOk<R>(R Function(T) onOkHandler) {
    if (isOk) return onOkHandler(data as T);
    throw Exception("Error while trying on OK; $this");
  }

  R tryOnError<R>(R Function(ErrorData) onErrHandler) {
    if (isErr) return onErrHandler(error!);
    throw Exception("Error while trying on ERR; $this");
  }

  R tryOnEmpty<R>(R Function() onEmptyHandler) {
    if (isErr) return onEmptyHandler();
    throw Exception("Error while trying on EMPTY; $this");
  }

  R? onOk<R>(R Function(T) onOkHandler) {
    if (isOk) return onOkHandler(data as T);
    return null;
  }

  R? onError<R>(R Function(ErrorData) onErrHandler) {
    if (isErr) return onErrHandler(error!);
    return null;
  }

  R? onEmpty<R>(R Function() onEmptyHandler) {
    if (isErr) return onEmptyHandler();
    return null;
  }

  R onEach<R>({
    required R Function(T) onOkHandler,
    required R Function(ErrorData) onErrHandler,
    required R Function() onEmptyHandler,
  }) {
    if (isOk) return onOkHandler(data as T);
    if (isErr) return onErrHandler(error!);
    if (isEmpty) return onEmptyHandler();
    throw Exception("Unexpected state; $this");
  }

  @override
  String toString() {
    return "Result {\ndata: ${data.toString()},\nerror: ${error.toString()}\n}";
  }
}

class ErrorData {
  final Map<String, String> messages;

  ErrorData({required this.messages});
}