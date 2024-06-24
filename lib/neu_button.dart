import 'package:flutter/material.dart';

class NeuButton extends StatelessWidget {
  final Function onTap;
  final bool isButtonPressed;

  const NeuButton({
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
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (isButtonPressed) ...[
              // darker shadow on bottom right
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(6, 6),
                blurRadius: 15,
                spreadRadius: 1,
              ),

              // lighter shadow on top left
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-6, -6),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ],
        ),
        child: Icon(
          Icons.favorite,
          size: 60,
          color: isButtonPressed ? Colors.red[400] : Colors.grey,
        ),
      ),
    );
  }
}
