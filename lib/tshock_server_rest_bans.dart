import 'tshock_server_rest.dart';
import 'tshock_server_rest_server.dart';

class TShockServerRESTBans {
  TShockServerRESTBans._();
  static final TShockServerRESTBans instance = TShockServerRESTBans._();

  Future<List<TShockBannedUser>> getAllBans() async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/bans/list?token=$_token';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        final users = map['bans'] as Iterable;
        return users.map((e) => TShockBannedUser.fromJson(e)).toList();
      }
    }
    return null;
  }

  Future<TShockBannedUser> getBannedUserByName(String username) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url =
        '$_baseUrl/v2/bans/read?token=$_token&type=name&ban=$username&caseinsensitive=true';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return TShockBannedUser.fromJson(map);
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> banUser(String name,
      {String reason = ''}) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/bans/create?token=$_token&name=$name&reason=$reason';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> removeBan(String name) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/bans/destroy?token=$_token&type=name&ban=$name';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      }
    }
    return null;
  }
}
