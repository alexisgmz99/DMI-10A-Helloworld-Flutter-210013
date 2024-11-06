import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Counter Functions - 210013',
            style: GoogleFonts.rubikWetPaint(), // Aplica la fuente al título del AppBar
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: GoogleFonts.rubikWetPaint(
                fontSize: 160,
                fontWeight: FontWeight.w300,
                color: clickCounter > 0
                    ? Colors.green
                    : clickCounter < 0
                        ? Colors.red
                        : Colors.blue,
              ),
            ),
            Text(
              (clickCounter == 1 || clickCounter == -1) ? 'Click' : 'Clicks',
              style: GoogleFonts.rubikWetPaint( // Aplica la fuente al texto "Click/Clicks"
                fontSize: 25,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.plus_one,
            color: Colors.green,
            onPressed: () {
              clickCounter++;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            color: Colors.red,
            onPressed: () {
              clickCounter--;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.refresh_rounded,
            color: Colors.blue,
            onPressed: () {
              clickCounter = 0;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: color,
      child: Icon(icon),
    );
  }
}
