import 'package:yes_order/consts/urls.dart';
import 'package:yes_order/module_auth/service/auth_service/auth_service.dart';
import 'package:yes_order/module_network/http_client/http_client.dart';
import 'package:inject/inject.dart';

@provide
class NotificationRepo {
  final ApiClient _apiClient;
  final AuthService _authService;

  NotificationRepo(this._apiClient, this._authService);

  void postToken(String token) {
    _authService.getToken().then(
      (value) {
        _apiClient.post(Urls.NOTIFICATION_API, {'token': token},
            headers: {'Authorization': 'Bearer ${value}'});
      },
    );
  }
}
