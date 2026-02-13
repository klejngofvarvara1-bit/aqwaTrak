import 'package:flutter/material.dart';
import '../app_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBFF3F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFBFF3F1),
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF1E2A8A),
            fontWeight: FontWeight.w800,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF1E2A8A)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder<int>(
          valueListenable: appState.dailyGoalMl,
          builder: (context, goal, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daily goal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E2A8A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$goal ml',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Slider(
                  value: goal.toDouble(),
                  min: 500,
                  max: 4000,
                  divisions: 35,
                  onChanged: (v) => appState.setGoal(v.round()),
                ),
                const SizedBox(height: 20),

                SwitchListTile(
                  value: notifications,
                  onChanged: (v) => setState(() => notifications = v),
                  title: const Text(
                    'Notifications',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: const Text('Remind me to drink water'),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Saved!')),
                      );
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
