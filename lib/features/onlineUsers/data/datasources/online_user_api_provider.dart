import 'package:arman_amin/core/network/data_state.dart';
import 'package:arman_amin/core/network/error_handler.dart';
import 'package:arman_amin/core/network/http_request_handler.dart';
import 'package:arman_amin/core/network/http_urls.dart';

class OnlineUserApiProvider {
  Future<DataState<Map<String, dynamic>>> getUsers(
      {required int offset, int limit = 10}) async {
    try {
      var result = await HttpRequestHanlder.get(
        HttpUrls.users,
        parameters: {
          'offset': offset,
          'limit': limit,
        },
      );
      if (result.$1 != null) {
        return DataSuccess(data: result.$1!);
      } else {
        return DataFailed(error: result.$2!);
      }
    } catch (e) {
      return DataFailed(
        error: ErrorHandler(
          message: "somethings went wrong...",
          status: "Failed",
          statusCode: 500,
        ),
      );
    }
  }
}
