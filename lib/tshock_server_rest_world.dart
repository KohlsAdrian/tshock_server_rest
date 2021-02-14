import 'tshock_server_rest.dart';
import 'tshock_server_rest_server.dart';

class TShockServerRESTWorld {
  TShockServerRESTWorld._();
  static final TShockServerRESTWorld instance = TShockServerRESTWorld._();

  Future<TShockWorld> info() async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/world/read?token=$_token';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return TShockWorld.fromJson(map);
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> spawnMeteor() async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/world/meteor?token=$_token';
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

  Future<Map<String, dynamic>> setBloodMoon(bool enabled) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/world/bloodmoon/$enabled?token=$_token';
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

  Future<Map<String, dynamic>> setAutoSave(bool enabled) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/world/autosave/state/$enabled?token=$_token';
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

  Future<Map<String, dynamic>> save() async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/world/save?token=$_token';
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

  Future<Map<String, dynamic>> butcher({bool killFriendly = false}) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url =
        '$_baseUrl/v2/world/butcher?token=$_token&killfriendly=$killFriendly';
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
