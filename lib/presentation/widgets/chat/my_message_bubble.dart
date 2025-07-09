import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipPath(
          clipper: MessageBubbleClipperRight(),
          child: Container(
            color: colors.primary, // o tu color personalizado
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
              child: Text("Magna esse laboris sint qui ut id eiusmod.", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),

        SizedBox(height: 10),
      ],
    );
  }
}

class MessageBubbleClipperRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 16.0;
    double tailSize = 6.0;

    final path = Path();
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0); // top-left
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius); // top-right
    path.lineTo(size.width, size.height - radius - tailSize);

    // tail
    path.quadraticBezierTo(
      size.width,
      size.height - tailSize,
      size.width - tailSize,
      size.height - tailSize,
    );
    path.lineTo(size.width - tailSize - 2, size.height);
    path.lineTo(size.width - radius - 2, size.height - tailSize);

    path.lineTo(radius, size.height - tailSize);
    path.quadraticBezierTo(
      0,
      size.height - tailSize,
      0,
      size.height - radius - tailSize,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
