import 'package:flutter/material.dart';
import 'package:flutter_textmsg_fb_app/services/auth/auth_service.dart';
import 'package:flutter_textmsg_fb_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logOut() {
    //get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              const DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.chair,
                    size: 100,
                    //color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              //home list Tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 40,
                    weight: 40,
                  ),
                  onTap: () {
                    //pop the drawer
                    Navigator.pop(context);
                  },
                  title: const Text(
                    "H O M E",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //setting list tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.settings,
                    size: 40,
                    weight: 40,
                  ),
                  onTap: () {
                    //pop the settings button
                    Navigator.pop(context);
                    //Navigate to Settings Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                  title: const Text(
                    "S E T T I N G S",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
            ],
          ),

          //logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                size: 40,
                weight: 40,
              ),
              title: const Text(
                "L O G O U T",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: logOut,
            ),
          ),
        ],
      ),
    );
  }
}
