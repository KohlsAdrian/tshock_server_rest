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

  final unban = await tssr.bans.removeBan('dart');
  print(unban.toString());

  final world = await tssr.world.info();
  print(world.time);

  final meteor = await tssr.world.spawnMeteor();
  print(meteor.toString());

  final bloodmoonTrue = await tssr.world.setBloodMoon(true);
  print(bloodmoonTrue.toString());

  final bloodmoonFalse = await tssr.world.setBloodMoon(false);
  print(bloodmoonFalse.toString());

  final save = await tssr.world.save();
  print(save.toString());

  final autosave = await tssr.world.setAutoSave(true);
  print(autosave.toString());

  final butcher = await tssr.world.butcher();
  print(butcher.toString());

  final createGroup =
      await tssr.groups.create('dart', 'default', [], 255, 255, 255);
  print(createGroup.toString());

  final deleteGroup = await tssr.groups.delete('dart');
  print(deleteGroup.toString());

  final createGroup2 =
      await tssr.groups.create('dart', 'default', [], 255, 255, 255);
  print(createGroup2.toString());

  final groups = await tssr.groups.list();
  groups.forEach((g) => print(g.toMap()));

  final group = await tssr.groups.read(groups.first.name);
  print(group.toMap());

  final updateGroup = await tssr.groups.update('dart');
  print(updateGroup.toString());

  //final shutdown = tssr.shutdown(true);
  //print(shutdown);
}
