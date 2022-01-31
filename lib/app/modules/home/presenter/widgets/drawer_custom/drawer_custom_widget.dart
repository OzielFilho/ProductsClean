import 'package:agence_teste/app/app_controller.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/user_result_logged.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerCustom extends StatelessWidget {
  final UserResultLogged? userResultLogged;
  const DrawerCustom({Key? key, this.userResultLogged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: userResultLogged != null
            ? ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(userResultLogged!.name),
                    accountEmail: Text(userResultLogged!.email),
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(userResultLogged!.photo)),
                  ),
                  ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: const Text("Profile"),
                      onTap: () {
                        Modular.to.pop(context);
                      }),
                  ListTile(
                      leading: const Icon(
                        Icons.list_alt_outlined,
                        color: Colors.white,
                      ),
                      title: const Text("My Products"),
                      onTap: () {
                        Modular.to.pop(context);
                      }),
                  ListTile(
                      leading: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      title: const Text("Settings"),
                      onTap: () {
                        Modular.to.pop(context);
                      }),
                  ListTile(
                      leading: const Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                      ),
                      title: const Text("Logout"),
                      onTap: () => Modular.get<AppController>().logout()),
                ],
              )
            : Container());
  }
}
