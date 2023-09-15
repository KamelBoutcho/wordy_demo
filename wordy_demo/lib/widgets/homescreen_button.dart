import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

import '../screens/game_screen.dart';
import '../utils/my_layout.dart';
import '../utils/styles.dart';

class HomeScreenButton extends StatefulWidget {
  final String buttonName;

  const HomeScreenButton({Key? key, required this.buttonName}) : super(key: key);

  @override
  State<HomeScreenButton> createState() => _HomeScreenButtonState();
}

class _HomeScreenButtonState extends State<HomeScreenButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isButtonPressed = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return GestureDetector(
      onTapDown: (_) {
        _animationController.forward();
        setState(() {
          _isButtonPressed = true;
        });
      },
      onTapUp: (_) {
        _animationController.reverse();
        setState(() {
          _isButtonPressed = false;
        });
        _navigateToGameScreen();
      },
      onTapCancel: () {
        _animationController.reverse();
        setState(() {
          _isButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        width: size.width * 0.80,
        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15)),
        decoration: BoxDecoration(
          color: _isButtonPressed ? const Color(0xFFA0A0A0) : const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(AppLayout.getWidth(10)),
            right: Radius.circular(AppLayout.getHeight(10)),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,

              offset: Offset(0, 3),
            )
          ],
        ),
        duration: const Duration(milliseconds: 100),
        child: Center(
          child: Text(
            widget.buttonName,
            style: Styles.headlineStyle2.copyWith(
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToGameScreen() {
    final BuildContext context = this.context; // Store the context in a local variable

    _animationController.reverse().then((_) {
      setState(() {
        _isButtonPressed = false;
      });

      if (widget.buttonName == "Play") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const GameScreen()));
      }
    });
  }
}
