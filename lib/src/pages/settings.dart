import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/src/blocs/menu-item.dart';
import 'package:task_manager/src/blocs/online_mode.dart';
import 'package:task_manager/src/functions/base_functions.dart';
import 'package:task_manager/src/styles/styles.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool load = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context); // provider
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/logo.png',
        ),
        title: Text("Setting"),
        actions: const [OnlineMode()],
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? DarkColors.background
          : LightColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: load
              ? Text(
                  "Load ...",
                  style: TextStyle(
                      color: !(Theme.of(context).brightness == Brightness.dark)
                          ? DarkColors.background
                          : LightColors.background),
                )
              : ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    MenuItem(
                      icon: const Icon(Icons.person),
                      text: serviceProvider.userDetails['userName'] ?? "",
                      subtitle: 'Profile and preferences',
                      ontab: () {},
                    ),
                    MenuItem(
                      icon: Icon(serviceProvider.themeMode == ThemeMode.dark
                          ? Icons.dark_mode
                          : Icons.light_mode),
                      text: 'Mode',
                      ontab: () {
                        setState(() {
                          serviceProvider.toggleTheme(
                              !(serviceProvider.themeMode == ThemeMode.dark));
                        });
                      },
                      subtitle: serviceProvider.themeMode == ThemeMode.dark
                          ? 'Dark Mode'
                          : 'Light Mode',
                    ),
                    MenuItem(
                      icon: Icon(
                        Icons.logout,
                        color: redColor,
                      ),
                      text: 'Logout',
                      subtitle: '',
                      ontab: () async {
                        setState(() {
                          load = true;
                        });
                        await logout(context, serviceProvider);

                        setState(() {
                          load = false;
                        });
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
    ;
  }
}
