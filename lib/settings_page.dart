import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'about_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('settings').listenable(),
        builder: (context, Box settingsBox, _) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Existing Dark Mode switch
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: settingsBox.get('isDarkMode', defaultValue: false),
                onChanged: (value) => settingsBox.put('isDarkMode', value),
              ),
              const Divider(),
              
              // Add About section
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('About'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}