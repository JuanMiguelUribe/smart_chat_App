import 'package:flutter/material.dart';

class HisMessageBubble extends StatelessWidget {
  const HisMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipPath(
          clipper: MessageBubbleClipperLeft(),
          child: Container(
            color: colors.secondary, // o tu color personalizado
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
              child: Text(
                "Aliquip Lorem quis est quis sunt irure.",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),

        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: _ImageBubble(),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;// MediaQuery.of(context, child: child)
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/no/18-1ba72d815ec0e2bff8dba8699a50e275.gif",
        width: size.width * 0.5,
        height: size.height * 0.2,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.5,
            height: size.height * 0.2,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Center(child: const Text("Cargando...")),
          );
        },
      ),
    );
  }
}

class MessageBubbleClipperLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 16.0;
    double tailSize = 6.0;

    final path = Path();
    path.moveTo(tailSize + radius + 4, 0);
    path.quadraticBezierTo(tailSize + 0, 0, tailSize + 0, radius); // top-left
    path.lineTo(tailSize + 0, size.height - radius - tailSize);

    // Tail
    path.quadraticBezierTo(
      tailSize + 0,
      size.height - tailSize,
      tailSize + tailSize,
      size.height - tailSize,
    );
    path.lineTo(tailSize + tailSize + 2, size.height);
    path.lineTo(tailSize + radius + 2, size.height - tailSize);

    path.lineTo(size.width - radius, size.height - tailSize);
    path.quadraticBezierTo(
      size.width,
      size.height - tailSize,
      size.width,
      size.height - radius - tailSize,
    );
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width, 0, size.width - radius, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
