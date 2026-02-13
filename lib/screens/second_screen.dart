import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBFDCDC),
      body: Stack(
        children: [
          // wave (упрощённо, но похоже на макет)
          Positioned(
            left: -120,
            right: -120,
            bottom: -80,
            child: Container(
              height: 420,
              decoration: BoxDecoration(
                color: const Color(0xFF7DAAC9),
                borderRadius: BorderRadius.circular(260),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 70),

                const Text(
                  '1,200 ml',
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1E2A8A),
                  ),
                ),

                const SizedBox(height: 120),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Text(
                      '48%',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1E2A8A),
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                // plus button
                Container(
                  width: 78,
                  height: 78,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE9E9E9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, size: 42, color: Colors.black),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),

          // back (как стрелка сверху слева)
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

