import 'package:http/http.dart' as http;

class BaseClient extends http.BaseClient {
  BaseClient(this._inner);

  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers['Content-Type'] = 'application/json';
    return _inner.send(request);
  }
}
