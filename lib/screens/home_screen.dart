import 'package:flutter/material.dart';
import '../app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _formatMl(int ml) {
    // 1200 -> "1,200"
    final s = ml.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final posFromEnd = s.length - i;
      buf.write(s[i]);
      if (posFromEnd > 1 && posFromEnd % 3 == 1) buf.write(',');
    }
    return buf.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBFF3F1),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'current data',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2A8A),
              ),
            ),
            const SizedBox(height: 40),

            // Слушаем изменения и перерисовываем круг
            ValueListenableBuilder<int>(
              valueListenable: appState.dailyGoalMl,
              builder: (context, goal, _) {
                return ValueListenableBuilder<int>(
                  valueListenable: appState.currentMl,
                  builder: (context, current, __) {
                    final percent = goal <= 0 ? 0 : ((current / goal) * 100).round();
                    final mlText = '${_formatMl(current)} ml';

                    return Container(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF00D5D5),
                          width: 12,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$percent%',
                              style: const TextStyle(
                                fontSize: 44,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              mlText,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1E2A8A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  Row(
                    children: [
                      DoseButton(
                        bg: const Color(0xFF9C9ED6),
                        icon: Icons.water_drop_outlined,
                        text: '250 ml',
                        onTap: () => appState.addWater(250),
                      ),
                      const SizedBox(width: 16),
                      DoseButton(
                        bg: const Color(0xFFD9B59C),
                        icon: Icons.coffee_outlined,
                        text: '180 ml',
                        onTap: () => appState.addWater(180),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DoseButton(
                        bg: const Color(0xFFD8D3A1),
                        text: '500 ml',
                        onTap: () => appState.addWater(500),
                      ),
                      const SizedBox(width: 16),
                      DoseButton(
                        bg: Colors.white,
                        icon: Icons.local_drink_outlined,
                        text: '250 ml',
                        border: true,
                        onTap: () => appState.addWater(250),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}

class DoseButton extends StatelessWidget {
  final Color bg;
  final IconData? icon;
  final String text;
  final bool border;
  final VoidCallback? onTap;

  const DoseButton({
    super.key,
    required this.bg,
    this.icon,
    required this.text,
    this.border = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(18),
            border: border ? Border.all(color: Colors.black12) : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, size: 26),
              if (icon != null) const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
