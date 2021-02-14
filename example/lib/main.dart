import 'package:tshock_server_rest/model/tshock_user.dart';
import 'package:tshock_server_rest/tshock_server_rest.dart';
import 'package:tshock_server_rest/tshock_server_rest_server.dart';

TShockServerRESTServer tssr = TShockServerRESTServer.instance;
String token =
    'E7C12C616AFAD9EC2658F86CB86A151C0B058C48E8DE411D212CEE61E3D82143';
void main() async {
  tssr.init(
    '127.0.0.1',
    7878,
    token,
    isHttps: false,
  );

  TShockServerStatus status = await tssr.status();
  print(status.uptime);

  final rawcmd = await tssr.rawCommand('/say I said dart!');
  print(rawcmd.toString());

  final tokenTest = await tssr.testToken();
  print(tokenTest.toString());

  final broadcast = await tssr.broadcast('dart full');
  print(broadcast.toString());

  final users = await tssr.users.getAllUsers();
  users.forEach((element) => print(element.toMap()));

  final activeusers = await tssr.users.getActiveUsers();
  activeusers.map((e) => print(e));

  final destroyResult = await tssr.users.destroyUserByName('dart');
  print(destroyResult);

  final createResult = await tssr.users.createUser('dart', 'dart', 'default');
  print(createResult);

  TShockUser getUserByName = await tssr.users.getUserByName('dart');
  print(getUserByName.toMap());
  TShockUser getUserById = await tssr.users.getUserById(getUserByName.id);
  print(getUserById.toMap());

  final updateByName =
      await tssr.users.updateUserByName('dart', group: 'default');
  print(updateByName.toString());
  final updateById =
      await tssr.users.updateUserById(getUserById.id, group: 'default');
  print(updateById.toString());

  final banuser = await tssr.bans.banUser('dart', reason: 'testing');
  print(banuser.toString());

  final bans = await tssr.bans.getAllBans();
  bans.forEach((element) => print('banned: ${element.name}'));

  final bannedName = await tssr.bans.getBannedUserByName('dart');
  print(bannedName.toMap());

  //final shutdown = tssr.shutdown(true);
  //print(shutdown);
}
