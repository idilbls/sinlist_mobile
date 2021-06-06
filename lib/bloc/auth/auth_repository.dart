import 'package:sinlist_mobile/core/http/api_provider.dart';
import 'package:sinlist_mobile/core/http/api_result.dart';
import 'package:sinlist_mobile/core/http/network_exceptions.dart';
import 'package:sinlist_mobile/data/auth/auth_request.dart';
import 'package:sinlist_mobile/data/auth/auth_response.dart';

class AuthRepository {
  AuthRepository(this._apiProvider);

  final ApiProvider _apiProvider;
  Future<ApiResult<AuthResult>> login(AuthRequest request) async {
    try {
      final response = await _apiProvider.post("TokenAuth/Authenticate", data: request.toJson());
      AuthResponse apiResponse = AuthResponse.fromJson(response);
      if (apiResponse.success)
        return ApiResult.success(data: apiResponse.result);
      else
        return ApiResult.failure(error: apiResponse.error);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
