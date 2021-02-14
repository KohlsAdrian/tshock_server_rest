import 'tshock_server_rest.dart';
import 'tshock_server_rest_server.dart';

class TShockServerRESTGroups {
  TShockServerRESTGroups._();
  static final TShockServerRESTGroups instance = TShockServerRESTGroups._();

  Future<Map<String, dynamic>> create(
    String name,
    String parent, [
    List<String> permissions = const [],
    int chatRgbRED = 255,
    int chatRgbGREEN = 255,
    int chatRgbBLUE = 255,
  ]) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/groups/create?token=$_token';

    String mPermissions = '';
    permissions.forEach((p) {
      mPermissions += p;
      if (p != permissions.last) mPermissions += ',';
    });

    String params = 'group=$name';
    params += '&permissions=$mPermissions';
    params += '&parent=$parent';
    params += '&chatcolor=$chatRgbRED,$chatRgbGREEN,$chatRgbBLUE';

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

  Future<Map<String, dynamic>> delete(String name) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/groups/destroy?token=$_token';

    String params = 'group=$name';

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

  Future<TShockGroup> read(String name) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/groups/read?token=$_token';

    String params = 'group=$name';

    final response = await get('$url&$params');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        return TShockGroup.fromJson(map);
      } else {
        print(jsonString);
      }
    }
    return null;
  }

  Future<List<TShockGroup>> list() async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/groups/list?token=$_token';
    final response = await get('$url');
    if (response.body != null) {
      String jsonString = utf8.decode(response.bodyBytes);
      Map<String, dynamic> map = json.decode(jsonString);
      if (map['status'] == '200') {
        final groups = map['groups'] as Iterable;
        return groups.map((e) => TShockGroup.fromJson(e)).toList();
      } else {
        print(jsonString);
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> update(
    String name, {
    String parent = 'default',
    List<String> permissions = const [],
    int chatRgbRED = 255,
    int chatRgbGREEN = 255,
    int chatRgbBLUE = 255,
  }) async {
    final _baseUrl = TShockServerRESTServer.instance.baseUrl;
    final _token = TShockServerRESTServer.instance.token;
    final url = '$_baseUrl/v2/groups/read?token=$_token';

    String mPermissions = '';
    permissions.forEach((p) {
      mPermissions += p;
      if (p != permissions.last) mPermissions += ',';
    });

    String params =
        'group=$name&parent=$parent&permissions=$mPermissions&chatcolor=$chatRgbRED,$chatRgbGREEN,$chatRgbBLUE';

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
