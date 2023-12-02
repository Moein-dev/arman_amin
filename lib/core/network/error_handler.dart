class ErrorHandler {
  final String message;
  final String status;
  final int? statusCode;

  ErrorHandler({
    required this.message,
    required this.status,
    this.statusCode,
  });
}