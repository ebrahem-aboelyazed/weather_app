import 'package:http/http.dart' as http;

class BaseClient extends http.BaseClient {
  BaseClient(this._inner);

  final http.Client _inner;

  //final TokenManager _tokenManager = TokenManager.instance;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    //final token = await _tokenManager.getAccessToken();
    request.headers['Content-Type'] = 'application/json';
    //request.headers['Authorization'] = 'Bearer $token';
    return _inner.send(request);
  }
}
