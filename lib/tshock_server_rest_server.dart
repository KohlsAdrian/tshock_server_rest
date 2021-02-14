import 'tshock_server_rest.dart';
import 'tshock_server_rest_bans.dart';
import 'tshock_server_rest_users.dart';

class TShockServerRESTServer {
  TShockServerRESTServer._();
  static final TShockServerRESTServer instance = TShockServerRESTServer._();
  static TShockServerRESTUsers _users = TShockServerRESTUsers.instance;
  static TShockServerRESTBans _bans = TShockServerRESTBans.instance;

  static String _ip = '127.0.0.1';
  static int _port = 7878;
  static String _token;

  static String _baseUrl = '$_ip:$_port';

  void init(
    String ip,
    int port,
    String token, {
    bool isHttps = true,
  }) {
    _token = token;
    _baseUrl = 'http${isHttps ? 's' : ''}://$ip:$port';
  }

  String get token => _token;
  String get baseUrl => _baseUrl;

  TShockServerRESTUsers get users => _users;
  TShockServerRESTBans get bans => _bans;

  Future<String> createToken(String username, String password) async {
    final url = '$_baseUrl/v2/token/create';
    final params = 'username=$username&password=$password';
    final response = await get('$url?$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        String token = map['token'];
        return token;
      }
    }
    print(response?.body);
    return null;
  }

  Future<TShockServerStatus> status() async {
    final url = '$_baseUrl/status?token=$_token';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return TShockServerStatus.fromJson(map);
      }
    }
    print(response?.body);
    return null;
  }

  Future<Map<String, dynamic>> testToken() async {
    final url = '$_baseUrl/tokentest?token=$_token';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      }
    }
    print(response?.body);
    return null;
  }

  Future<Map<String, dynamic>> broadcast(String message) async {
    final url = '$_baseUrl/v2/server/broadcast?token=$_token&msg=$message';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      }
    }
    print(response?.body);
    return null;
  }

  Future<Map<String, dynamic>> shutdown(bool confirm,
      {bool nosave = false}) async {
    final url =
        '$_baseUrl/v2/server/off?token=$_token&confirm=$confirm&nosave=$nosave';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      }
    }
    print(response?.body);
    return null;
  }

  Future<Map<String, dynamic>> rawCommand(String command) async {
    final url = '$_baseUrl/v3/server/rawcmd?token=$_token&cmd=$command';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      }
    }
    print(response?.body);
    return null;
  }
}
