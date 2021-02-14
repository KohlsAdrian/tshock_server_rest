import 'package:tshock_server_rest/tshock_server_rest_server.dart';

import 'tshock_server_rest.dart';

class TShockServerRESTUsers {
  TShockServerRESTUsers._();
  static final TShockServerRESTUsers instance = TShockServerRESTUsers._();

  Future<List<TShockUser>> getAllUsers() async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/users/list?token=$_token';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        final users = map['users'] as Iterable;
        return users.map((e) => TShockUser.fromJson(e)).toList();
      }
    }
    return null;
  }

  Future<List<String>> getActiveUsers() async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/users/activelist?token=$_token';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        String activeusers = map['activeusers'];
        final users = activeusers.split(' ');
        return users;
      }
    }
    return null;
  }

  Future<String> createUser(
      String username, String password, String group) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/users/create?token=$_token';
    final params = 'user=$username&password=$password&group=$group';
    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        String result = map['response'];
        return result;
      } else {
        String result = map['error'];
        return result;
      }
    }
    return null;
  }

  Future<String> destroyUserByName(String user) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/users/destroy?token=$_token';
    final params = 'user=$user&type=name';
    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        String result = map['response'];
        return result;
      } else {
        String result = map['error'];
        return result;
      }
    }
    return null;
  }

  Future<String> destroyUserById(String id) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/users/destroy?token=$_token';
    final params = 'user=$id&type=id';
    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        String result = map['response'];
        return result;
      } else {
        String result = map['error'];
        return result;
      }
    }
    return null;
  }

  Future<TShockUser> getUserByName(String user) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/users/read?token=$_token';
    final params = 'user=$user&type=name';
    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return TShockUser.fromJson(map);
      } else {
        print(jsonString);
      }
    }
    return null;
  }

  Future<TShockUser> getUserById(String id) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/users/read?token=$_token';
    final params = 'user=$id&type=id';
    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return TShockUser.fromJson(map);
      } else {
        print(jsonString);
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> updateUserByName(String username,
      {String password, String group}) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/users/update?token=$_token';

    String params = 'type=name&user=$username';
    if (password != null) params += '&password=$password';
    if (group != null) params += '&group=$group';

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

  Future<Map<String, dynamic>> updateUserById(String id,
      {String password, String group}) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/users/update?token=$_token';

    String params = 'type=id&user=$id';
    if (password != null) params += '&password=$password';
    if (group != null) params += '&group=$group';

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
