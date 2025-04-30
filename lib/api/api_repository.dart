import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  // Future<AuthUserResponse?> getProfile() async {
  //   final res = await apiProvider.getMethod(ApiConstants.getProfile);
  //   if (res.success == true) {
  //     return AuthUserResponse.fromJson(res.data);
  //   }
  //   return null;
  // }
}
