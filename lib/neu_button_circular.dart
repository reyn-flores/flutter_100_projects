import 'package:flutter/material.dart';

class NeuButtonCircular extends StatelessWidget {
  final Function onTap;
  final bool isButtonPressed;

  const NeuButtonCircular({
    super.key,
    required this.onTap,
    required this.isButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
          boxShadow: [
            if (isButtonPressed) ...[
              // darker shadow on bottom right
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(3, 3),
                blurRadius: 8,
                spreadRadius: 1,
              ),

              // lighter shadow on top left
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-3, -3),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ],
        ),
        child: Icon(
          Icons.bookmark,
          color: isButtonPressed ? Colors.red[400] : Colors.grey,
        ),
      ),
    );
  }
}
