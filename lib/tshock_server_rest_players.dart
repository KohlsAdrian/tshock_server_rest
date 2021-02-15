import 'package:tshock_server_rest/tshock_server_rest_server.dart';

import 'tshock_server_rest.dart';

class TShockServerRESTPlayers {
  TShockServerRESTPlayers._();
  static final TShockServerRESTPlayers instance = TShockServerRESTPlayers._();

  Future<Map<String, dynamic>> kick(String name, {String reason = ''}) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/players/update?token=$_token';

    String params = 'player=$name&reason=$reason';

    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      } else {
        print(jsonString);
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> ban(String name, {String reason = ''}) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/players/ban?token=$_token';

    String params = 'player=$name&reason=$reason';

    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      } else {
        print(jsonString);
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> kill(String name) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/players/kill?token=$_token';

    String params = 'player=$name';

    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      } else {
        print(jsonString);
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> mute(String name, {String reason = ''}) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/players/mute?token=$_token';

    String params = 'player=$name&reason=$reason';

    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      } else {
        print(jsonString);
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> unmute(String name, {String reason = ''}) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/players/unmute?token=$_token';

    String params = 'player=$name&reason=$reason';

    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return map;
      } else {
        print(jsonString);
      }
    }
    return null;
  }
}
