import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Task Manager App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.grey),
            ),
            const Divider(height: 30),
            const Text(
              'Development Team:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            _buildTeamMember(
              icon: Icons.person,
              name: 'mohammed jemal',
              role: 'Lead Developer'
            ),
            _buildTeamMember(
              icon: Icons.design_services,
              name: 'Selehadin Esmael ',
              role: 'UI/UX Designer'
            ),
            _buildTeamMember(
              icon: Icons.bug_report,
              name: 'Seid Kedir',
              role: 'QA Tester'
            ),
            _buildTeamMember(
              icon: Icons.coffee_maker,
              name: 'Jemal Abebayehu',
              role: ' coffee maker'
            ),
            _buildTeamMember(
              icon: Icons.design_services,
              name: 'Sosna Ebrahim',
              role: 'nothing '
            ),
            const Spacer(),
            const Center(
              child: Text(
                '© 2024 Task Manager Team\nAll rights reserved',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember({required IconData icon, required String name, required String role}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(name),
      subtitle: Text(role),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
    );
  }
}